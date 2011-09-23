package ru.gotoandstop.screen{	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import ru.gotoandstop.screen.events.ScreenEvent;
	import ru.gotoandstop.ui.UIElement;
	
	[Event(name="enabled", type="ru.gotoandstop.screen.events.ScreenEvent")]
	[Event(name="disabled", type="ru.gotoandstop.screen.events.ScreenEvent")]
	
	/**
	 * Базовый класс экрана. Класс является абстрактным
	 * Должен быть переделан под это )))
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class Screen extends UIElement implements IScreen{
		private var _key:String;
		public function get key():String{
			return this._key;
		}
		
		private var _enabled:Boolean;
		public function get enabled():Boolean{
			return this._enabled;
		}
		
		private var _manager:ScreenMachine;
		public function get machine():ScreenMachine{
			return this._manager;
		}
		public function set machine(value:ScreenMachine):void{
			this._manager = value;
		}
		
		public function Screen(key:String){
			super();
			this._key = key;
		}
		
		public function getView():DisplayObject{
			return null;
		}
		
		public override function toString():String{
			var text:String = '[screen <key>]';
			text = text.replace(/<key>/, this.key);
			return text;
		}
		
		public function send(...params):void{
			
		}
		
		public function activate():void{
			if(this.machine){
				this.machine.activateScreen(this.key);
			}
		}
		
		public function enable():void{
			this._enabled = true;
			super.dispatchEvent(new ScreenEvent(ScreenEvent.ENABLED, false, false));
		}
		
		public function disable():void{
			this._enabled = false;
			super.dispatchEvent(new ScreenEvent(ScreenEvent.DISABLED, false, false));
		}
	}
}