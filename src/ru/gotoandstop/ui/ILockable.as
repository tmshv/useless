package ru.gotoandstop.ui{
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public interface ILockable{
		function lock():void;
		function unlock():void;
		function get isLocked():Boolean;
	}
}