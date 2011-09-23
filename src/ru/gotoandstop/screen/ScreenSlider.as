package ru.gotoandstop.screen{
	import caurina.transitions.Tweener;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	[Event(name="complete", type="flash.events.Event")]
	
	/**
	 * Контейнер состояний
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ScreenSlider extends EventDispatcher implements IScreenBehavior{
		private var active:IScreen;
		private var next:IScreen;
		
		private var tweenTime:uint;
		private var transition:String;
		private var slideValue:Number;
		
		/**
		 * Конструктор класса. 
		 * @param time время анимации в миллисекундах
		 * @param transition тип анимации
		 * 
		 */
		public function ScreenSlider(value:Number, time:uint=500, transition:String='easeInSine'){
			this.slideValue = value;
			this.tweenTime = time;
			this.transition = transition;
		}
		
		public function action(active:IScreen, next:IScreen):void{
			var can_work:Boolean;
			can_work = Boolean(next);
			if(active){
				var same_parent:Boolean = active.machine == next.machine;
				can_work = can_work && same_parent;
			}
			
			if(can_work){
				this.active = active;
				this.next = next;
				
				var manager:ScreenMachine = next.machine;
				var coord:Point = new Point();
				if(this.active){
					const active_view:DisplayObject = next.getView();
//					coord.x += active_view.x;
//					coord.y += active_view.y;
				}
				coord.x += this.slideValue;
				
				const view:DisplayObject = next.getView();
				view.x = coord.x;
				view.y = coord.y;
				
				Tweener.addTween(view, {
					time: 0.5,
					x: 0,
					transition:'easeOutQuad',
					onUpdate: this.onShowTweenUpdate,
					onComplete: this.onShowTweenComplete
				});
			}else{
				return;
			}
		}
		
		private function onShowTweenUpdate():void{
			if(this.active && this.next){
				var active_layout:DisplayObject = this.active.getView();
				var showed_layout:DisplayObject = this.next.getView();
				active_layout.x = showed_layout.x - this.slideValue;
			}
		}
		
		private function onShowTweenComplete():void{
			super.dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}