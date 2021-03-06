package ru.gotoandstop.values{
	import flash.events.IEventDispatcher;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public interface IValue extends IEventDispatcher{
		function get id():String;
		function set id(value:String):void;
		function getValue():*;
		function setValue(value:*):void;
		function update():void;
        function on(listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void;
        function off(listener:Function, useCapture:Boolean = false):void;
	}
}