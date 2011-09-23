package ru.gotoandstop.mvc{
	import flash.display.DisplayObject;
	
	import mx.modules.IModule;

	/**
	 *
	 * @author Timashev Roman
	 */
	public interface IView{
		function get model():IModel;
		function get displayable():DisplayObject;
	}
}