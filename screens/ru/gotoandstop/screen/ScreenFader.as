package ru.gotoandstop.screen{
	import caurina.transitions.Tweener;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	[Event(name="complete", type="flash.events.Event")]
	
	/**
	 * 
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ScreenFader extends EventDispatcher implements IScreenSwitcher{
		private var active:IScreen;
		private var next:IScreen;
		
		private var tweenTime:uint;
		private var transition:String;
		
		/**
		 * Конструктор класса. 
		 * @param time время анимации в миллисекундах
		 * @param transition тип анимации
		 * 
		 */
		public function ScreenFader(time:uint=500, transition:String='easeInSine'){
			this.tweenTime = time;
			this.transition = transition;
		}
		
		public function action(active:IScreen, next:IScreen):void{
			//trace('screen fader do action', active, next)
			
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
					coord.x = active_view.x;
					coord.y = active_view.y;
				}
				
				const next_view:DisplayObject = next.getView();
				next_view.x = coord.x;
				next_view.y = coord.y;
				next_view.alpha = 0;
				
				Tweener.addTween(next_view, {
					time: this.tweenTime/1000,
					alpha: 1,
					transition: this.transition,
					onComplete: this.onShowTweenComplete
				});
			}else{
				return;
			}
		}
		
		private function onShowTweenComplete():void{
			super.dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}