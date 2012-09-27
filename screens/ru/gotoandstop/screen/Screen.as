package ru.gotoandstop.screen {
import flash.display.DisplayObject;
import flash.display.Sprite;

import ru.gotoandstop.IDisposable;
import ru.gotoandstop.screen.events.ScreenEvent;

[Event(name="enabled", type="ru.gotoandstop.screen.events.ScreenEvent")]
[Event(name="disabled", type="ru.gotoandstop.screen.events.ScreenEvent")]

/**
 * Базовый класс экрана. Класс является абстрактным
 * Должен быть переделан под это )))
 * @author Roman Timashev (roman@tmshv.ru)
 */
public class Screen extends Sprite implements IScreen {
    private var _key:String;
    public function get key():String {
        return this._key;
    }

    private var _enabled:Boolean;
    public function get enabled():Boolean {
        return this._enabled;
    }

    private var _temps:Vector.<IDisposable>;
    protected function get temps():Vector.<IDisposable> {
        return this._temps;
    }

    protected var locked:Boolean;

    public function get isLocked():Boolean {
        return this.locked;
    }

    public function lock():void {
        this.locked = true;
    }

    public function unlock():void {
        this.locked = false;
    }

    private var _machine:ScreenMachine;

    public function get machine():ScreenMachine {
        return this._machine;
    }

    public function set machine(value:ScreenMachine):void {
        this._machine = value;
    }

    public function Screen(key:String) {
        super();
        this._key = key;
        this._temps = new Vector.<IDisposable>();
    }

    public function getView():DisplayObject {
        return this;
    }

    public override function toString():String {
        return '[screen key]'.replace(/key/, this.key);
    }

    public function put(data:Object):void {

    }

    public function activate():void {
        if (this.machine) {
            this.machine.activateScreen(this.key);
        }
    }

    public function enable():void {
        this._enabled = true;
        super.dispatchEvent(new ScreenEvent(ScreenEvent.ENABLED, false, false));
    }

    public function disable():void {
        this._enabled = false;
        super.dispatchEvent(new ScreenEvent(ScreenEvent.DISABLED, false, false));
    }

    public function dispose():void {
        for each(var temp:IDisposable in this.temps) {
            temp.dispose();
        }

        this.temps.splice(0, this.temps.length - 1);
    }
}
}