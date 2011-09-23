package ru.gotoandstop.screen{
	import caurina.transitions.Tweener;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ScreenZoomer extends EventDispatcher implements IScreenBehavior{
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
		public function ScreenZoomer(){//value:Number, time:uint=500, transition:String='easeInSine'){
//			this.slideValue = value;
//			this.tweenTime = time;
//			this.transition = transition;
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
				
				//manager.container.swapChildren(
				
				const view:DisplayObject = next.getView();
				view.x = 0;
				view.y = 0;
				
				trace(view.x, view.y, view.width, view.height)
				
				var scale:Number = 2;
				var w:Number = view.width * scale;
				var h:Number = view.height * scale;
				
				var center:Point = new Point(
					view.x + view.width/2,
					view.y + view.height/2
				);
				
				trace(center)
				
				view.y = center.x - w/2;
				view.x = center.y - h/2;
				view.scaleX = scale;
				view.scaleY = scale;
				view.alpha = 0;
				
				trace(view.x, view.y, view.width, view.height)
				
				Tweener.addTween(view, {
					time: 0.5,
					x: 0,
					y: 0,
					scaleX: 1,
					scaleY: 1,
					alpha: 1,
					transition:'easeOutQuad',
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