/**
 *
 * User: tmshv
 * Date: 2/22/13
 * Time: 1:53 PM
 */
package ru.gotoandstop.values {
import flash.events.Event;
import flash.events.EventDispatcher;

internal class NoValue extends EventDispatcher implements IValue{
    private var _id:String;
    public function get id():String {
        return _id;
    }
    public function set id(value:String):void {
        _id = value;
    }

    public function NoValue() {

    }

    public function getValue():* {
        return null;
    }

    public function setValue(value:*):void {

    }

    public function update():void {
        super.dispatchEvent(new Event(Event.CHANGE));
    }

    public function on(listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        addEventListener(Event.CHANGE, listener, useCapture, priority, useWeakReference);
    }

    public function off(listener:Function, useCapture:Boolean = false):void {
        removeEventListener(Event.CHANGE, listener, useCapture);
    }

    public override function toString():String{
        return "[value]".replace("value", getValue());
    }
}
}
