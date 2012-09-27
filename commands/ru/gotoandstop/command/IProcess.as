package ru.gotoandstop.command{
	import flash.events.IEventDispatcher;
	

	/**
	 *
	 * Creation date: Aug 6, 2011
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public interface IProcess extends ICommand, IEventDispatcher{
		function discard():void;
	}
}