package ru.gotoandstop.mvc{
	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;
	
	import ru.gotoandstop.IDisposable;
	import ru.gotoandstop.ILockable;

	/**
	 *
	 * @author Timashev Roman
	 */
	public interface IController extends IEventDispatcher, IDisposable, ILockable{
		function get container():DisplayObjectContainer;
	}
}