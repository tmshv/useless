package ru.gotoandstop.ui.notifications{
	import flash.display.DisplayObject;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public interface INotification{
		function show():void;
		function hide():void;
		function getView():DisplayObject;
	}
}