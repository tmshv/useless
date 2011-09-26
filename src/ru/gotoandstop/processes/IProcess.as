package ru.gotoandstop.processes{
	import flash.events.IEventDispatcher;
	
	import ru.gotoandstop.command.ICommand;

	/**
	 *
	 * Creation date: Aug 6, 2011
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public interface IProcess extends ICommand, IEventDispatcher{
		function discard():void;
	}
}