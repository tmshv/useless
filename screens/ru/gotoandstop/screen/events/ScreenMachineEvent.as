package ru.gotoandstop.screen.events{
	import flash.events.Event;
	
	import ru.gotoandstop.screen.IScreen;
	
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ScreenMachineEvent extends Event{
		public static const REGISTRED:String = 'registred';
		
		private var _screen:IScreen;
		public function get screen():IScreen{
			return this._screen;
		}
		
		public function ScreenMachineEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, screen:IScreen=null){
			super(type, bubbles, cancelable);
			this._screen = screen;
		}
		
		public override function clone():Event{
			return new ScreenMachineEvent(super.type, super.bubbles, super.cancelable, this.screen);
		}
	}
}