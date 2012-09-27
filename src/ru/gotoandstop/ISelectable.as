package ru.gotoandstop{
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 **/
	public interface ISelectable{
		function select():void;
		function deselect():void;
		function get isSelected():Boolean;
	}
}