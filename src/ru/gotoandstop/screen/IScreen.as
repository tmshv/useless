package ru.gotoandstop.screen{
	import flash.display.DisplayObject;
	import flash.events.IEventDispatcher;
	
	import ru.gotoandstop.ui.ILockable;

	public interface IScreen extends IEventDispatcher, ILockable{
		function get machine():ScreenMachine;
		function set machine(value:ScreenMachine):void;
		
		function get key():String;
		function get enabled():Boolean;
		
		/**
		 * Включить экран
		 */
		function enable():void;
		
		/**
		 * Отключить экран
		 */
		function disable():void;
		
		function getView():DisplayObject;
		function send(...params):void;
		function activate():void;
	}
}