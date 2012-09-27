package ru.gotoandstop.screen.events{
	import flash.events.Event;
	
	import ru.gotoandstop.screen.IScreen;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ScreenEvent extends Event{
		public static const ENABLED:String = 'enabled';
		public static const DISABLED:String = 'disabled';
		public static const SHOWED:String = 'showed';
		public static const HIDED:String = 'hided';

		public function ScreenEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event{
			return new ScreenEvent(super.type, super.bubbles, super.cancelable);
		}
	}
}