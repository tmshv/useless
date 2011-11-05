package ru.gotoandstop.mvc{
	import flash.events.IEventDispatcher;
	
	import ru.gotoandstop.IDisposable;
	import ru.gotoandstop.ILockable;

	/**
	 *
	 * @author Timashev Roman
	 */
	public interface IModel extends IEventDispatcher, IDisposable, ILockable{
		function update():void;
	}
}