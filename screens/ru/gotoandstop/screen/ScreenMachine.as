package ru.gotoandstop.screen {
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Point;

import ru.gotoandstop.screen.events.ScreenEvent;
import ru.gotoandstop.screen.events.ScreenMachineEvent;

[Event(name="registred", type="ru.gotoandstop.screen.events.ScreenMachineEvent")]

/**
 * Класс отвечает за группу экранов.
 * @author Roman Timashev (roman@tmshv.ru)
 */
public class ScreenMachine extends EventDispatcher {
    /**
     * Флаг состояния работы переключения экранов
     */
    private var worked:Boolean;

    /**
     * Ширина окна экрана
     */
    private var width:uint;

    /**
     * Высота окна экрана
     */
    private var height:uint;

    /**
     * Библиотека зарегистрированных экранов текущей машины
     */
    private var _screens:Object;

    /**
     * Библиотека зарегистрированных экранов текущей машины
     */
    private var _list:Vector.<IScreen>;

    private var layerByScreen:Object = new Object();
    private var behaviorRules:Object = new Object();
    public var overrideBehavior:IScreenSwitcher;

    /**
     * Контейрей вьюшек экранов
     */
    private var _container:DisplayObjectContainer;
    public function get container():DisplayObjectContainer {
        return this._container;
    }

    /**
     * Ссылка на экран, указанный для активации
     */
    private var showedScreen:IScreen;

    /**
     * Ссылка на текущий активный экран
     */
    private var activeScreen:IScreen;

    /**
     * Экземпляр объекта-переключателя экранов
     */
    private var _behavior:IScreenSwitcher;
    public function get behavior():IScreenSwitcher {
        return this._behavior;
    }

    public function set behavior(value:IScreenSwitcher):void {
        if (!this.worked) {
            if (this._behavior) {
                this._behavior.removeEventListener(Event.COMPLETE, this.handleBehaviorActionComplete);
            }
            this._behavior = value;
            this._behavior.addEventListener(Event.COMPLETE, this.handleBehaviorActionComplete);
        }
    }

    /**
     *
     * @param container
     * @param dimension
     *
     */
    public function ScreenMachine(container:DisplayObjectContainer, dimension:Point) {
        super();
        this.width = dimension.x;
        this.height = dimension.y;
        this._container = container;

        _screens = new Object();
        _list = new Vector.<IScreen>();
    }

    /**
     * Реристрирует переданный стейт в текущей машине
     * @param state экземпляр класса <code>State</code>
     *
     */
    public function register(screen:IScreen):void {
        const key:String = screen.key;
        _screens[key] = screen;
        _list.push(screen);
        screen.machine = this;

        if (screen.enabled) screen.disable();
        screen.addEventListener(ScreenEvent.ENABLED, this.handleScreenEnabled);
        screen.addEventListener(ScreenEvent.DISABLED, this.handleStateDisabled);

        super.dispatchEvent(new ScreenMachineEvent(ScreenMachineEvent.REGISTRED, false, false, screen));
    }

    public function reg(key:String, definition:Object, layer:String = 'default'):void {
        var screen:SimpleScreen = new SimpleScreen(key, definition);
        register(screen);
        layerByScreen[key] = layer;
    }

    public function registerBehavior(rule:String, behavior:IScreenSwitcher):void {
        behaviorRules[rule] = behavior;
    }

    /**
     * Возвращает экземпляр <code>IScreen</code> по ключу
     * @param key уникальный ключ требуемого экрана
     * @return
     *
     */
    public function getScreen(key:String):IScreen {
        return this._screens[key] as IScreen;
    }

    public function exist(key:String):Boolean{
        return Boolean(_screens[key]);
    }

    public function getScreenByIndex(index:uint):IScreen {
        try {
            return _list[index];
        } catch (error:Error) {
            throw new ArgumentError('parameter index (iii) is invalid'.replace(/iii/, index));
        }
        return null;
    }

    public function getScreenIndex(screen:IScreen):int {
        return _list.indexOf(screen);
    }

    public function get screensNumber():uint {
        return _list.length;
    }

    /**
     * Переключиться на указанный экран
     * @param key
     *
     */
    public function activateScreen(key:String):void {
        var new_behavior:IScreenSwitcher = getBehavior(key);
        if (!new_behavior) {
            throw new Error('cannot find behavior to activate operation');
        }

        var current_screen_layer:String = layerByScreen[activeScreen];
        var new_screen_layer:String = layerByScreen[key];

        var old_key:String = showedScreen ? showedScreen.key : '';
        var same:Boolean = old_key == key;
        if (same || worked) return;

        this.showedScreen = getScreen(key);
        if (showedScreen) {
            showedScreen.enable();

            if (activeScreen) activeScreen.lock();
            showedScreen.lock();

            behavior = new_behavior;
            worked = true;
            behavior.action(activeScreen, showedScreen);
        } else {
            throw new ArgumentError('cannot find screen with name key'.replace("key", key));
        }
    }

    private function getBehavior(nextScreenKey:String):IScreenSwitcher {
        if (overrideBehavior) {
            return overrideBehavior;
        } else {
            const current_screen_key:String = activeScreen ? activeScreen.key : '';

            var max_count:uint;
            var leader_rule:String;

            for (var rule:String in behaviorRules) {
                var match:Array = rule.match(/(.*)->(.*)/);
                var count:uint = calcRuleKeyCount(match[1], current_screen_key) + calcRuleKeyCount(match[2], nextScreenKey);
                if (count > max_count) {
                    max_count = count;
                    leader_rule = rule;
                }
            }

            return behaviorRules[leader_rule];
        }
    }

    private function calcRuleKeyCount(ruleKey:String, key:String):uint {
        if (ruleKey == key) return 2;
        else if (ruleKey == '*') return 1;
        else return 0;
    }

    private function handleScreenEnabled(event:ScreenEvent):void {
        const screen:IScreen = event.target as IScreen;
        this.container.addChild(screen.getView());
        screen.dispatchEvent(new ScreenEvent(ScreenEvent.SHOWED));
    }

    private function handleStateDisabled(event:ScreenEvent):void {
        const screen:IScreen = event.target as IScreen;
        this.container.removeChild(screen.getView());
        screen.dispatchEvent(new ScreenEvent(ScreenEvent.HIDED));
    }

    private function handleBehaviorActionComplete(event:Event):void {
        if (this.activeScreen) {
            this.activeScreen.unlock();
            this.activeScreen.disable();
        }

        this.showedScreen.unlock();
        this.activeScreen = this.showedScreen;
        this.worked = false;
    }
}
}

import flash.geom.Point;

import ru.gotoandstop.screen.IScreen;

internal class ScreenInfo {
    public var screen:IScreen;
    public var layoutPosition:Point;

    public function ScreenInfo(screen:IScreen, layoutPosition:Point) {
        this.screen = screen;
        this.layoutPosition = layoutPosition;
    }
}