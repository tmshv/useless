package ru.gotoandstop.mvc{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	
	import mx.modules.IModule;
	
	import ru.gotoandstop.IDisposable;
	import ru.gotoandstop.ILockable;

	/**
	 *
	 * @author Timashev Roman
	 */
	public interface IView extends IEventDispatcher, IDisposable, ILockable{
		function get model():IModel;
		function get view():DisplayObject;
	}
}