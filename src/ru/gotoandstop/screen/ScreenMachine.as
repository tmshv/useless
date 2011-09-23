package ru.gotoandstop.screen{
	import caurina.transitions.Tweener;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	import ru.gotoandstop.screen.events.ScreenEvent;
	import ru.gotoandstop.screen.events.ScreenMachineEvent;
	
	[Event(name="registred", type="ru.gotoandstop.screen.events.ScreenMachineEvent")]
	
	/**
	 * Класс отвечает за группу экранов.
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ScreenMachine extends EventDispatcher{
		/**
		 * Флаг состояния работы переключения экранов
		 */
		private var worked:Boolean;
		
		/**
		 * Ширина окна экрана 
		 */
		private var width:uint;
		
		/**
		 * Высота окна экрана 
		 */
		private var height:uint;
		
		/**
		 * Библиотека зарегистрированных экранов текущей машины 
		 */
		private var _screens:Object;
		
		/**
		 * Контейрей вьюшек экранов
		 */
		private var _container:DisplayObjectContainer;
		public function get container():DisplayObjectContainer{
			return this._container;
		}
		
		/**
		 * Ссылка на экран, указанный для активации 
		 */
		private var showedScreen:IScreen;
		
		/**
		 * Ссылка на текущий активный экран
		 */
		private var activeScreen:IScreen;
		
		/**
		 * Экземпляр объекта-переключателя экранов 
		 */		
		private var _behavior:IScreenBehavior;
		public function get behavior():IScreenBehavior{
			return this._behavior;
		}
		public function set behavior(value:IScreenBehavior):void{
			if(!this.worked){
				if(this._behavior){
					this._behavior.removeEventListener(Event.COMPLETE, this.handleBehaviorActionComplete);
				}
				this._behavior = value;
				this._behavior.addEventListener(Event.COMPLETE, this.handleBehaviorActionComplete);
			}
		}
		
		/**
		 * 
		 * @param container
		 * @param dimension
		 * 
		 */
		public function ScreenMachine(container:DisplayObjectContainer, dimension:Point){
			super();
			this.width = dimension.x;
			this.height = dimension.y;
			this._container = container;
			this._screens = new Object();
		}
		
		/**
		 * Реристрирует переданный стейт в текущей машине 
		 * @param state экземпляр класса <code>State</code>
		 * 
		 */
		public function register(screen:IScreen):void{
			const key:String = screen.key;
			this._screens[key] = screen;
			screen.machine = this;
			
			if(screen.enabled) screen.disable();
			screen.addEventListener(ScreenEvent.ENABLED, this.handleScreenEnabled);
			screen.addEventListener(ScreenEvent.DISABLED, this.handleStateDisabled);
			
			super.dispatchEvent(new ScreenMachineEvent(ScreenMachineEvent.REGISTRED, false, false, screen));
		}
		
		/**
		 * Возвращает экземпляр <code>IScreen</code> по ключу
		 * @param key уникальный ключ требуемого экрана
		 * @return 
		 * 
		 */
		public function getScreen(key:String):IScreen{
			return this._screens[key] as IScreen;
		}
		
		/**
		 * Переключиться на указанный экран
		 * @param key
		 * 
		 */
		public function activateScreen(key:String):void{
			trace('screen machine want to activate screen', key)
			
			var old_key:String = this.showedScreen ? this.showedScreen.key : '';
			var same:Boolean = old_key == key;
			if(same || this.worked) return;
			
			this.showedScreen = this.getScreen(key);
			if(this.showedScreen){
				this.showedScreen.enable();
				
				if(this.activeScreen) this.activeScreen.lock();
				this.showedScreen.lock();
				
				this.behavior.action(this.activeScreen, this.showedScreen);
				
				this.worked = true;
			}
		}
		
		private function handleScreenEnabled(event:ScreenEvent):void{
			const screen:IScreen = event.target as IScreen;
			this.container.addChild(screen.getView());
		}
		
		private function handleStateDisabled(event:ScreenEvent):void{
			const screen:IScreen = event.target as IScreen;
			this.container.removeChild(screen.getView());
		}
		
		private function handleBehaviorActionComplete(event:Event):void{
			if(this.activeScreen){
				this.activeScreen.unlock();
				this.activeScreen.disable();
			}
			
			this.showedScreen.unlock();
			this.activeScreen = this.showedScreen;
			this.worked = false;
		}
	}
}
import flash.geom.Point;

import ru.gotoandstop.screen.IScreen;

internal class ScreenInfo{
	public var screen:IScreen;
	public var layoutPosition:Point;
	
	public function ScreenInfo(screen:IScreen, layoutPosition:Point){
		this.screen = screen;
		this.layoutPosition = layoutPosition;
	}
}