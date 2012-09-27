package ru.gotoandstop.screen{
import flash.display.DisplayObject;
import flash.events.IEventDispatcher;

import ru.gotoandstop.IDisposable;
import ru.gotoandstop.ILockable;

public interface IScreen extends IEventDispatcher, ILockable, IDisposable{
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
		function put(data:Object):void;
		function activate():void;
	}
}