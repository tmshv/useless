package ru.gotoandstop.screen{
	import flash.events.IEventDispatcher;
	
	[Event(name="complete", type="flash.events.Event")]
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public interface IScreenBehavior extends IEventDispatcher{
		function action(active:IScreen, next:IScreen):void;	
	}
}