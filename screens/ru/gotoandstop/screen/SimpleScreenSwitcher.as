/**
 *
 * User: tmshv
 * Date: 6/29/12
 * Time: 2:58 PM
 */
package ru.gotoandstop.screen {
import flash.events.Event;
import flash.events.EventDispatcher;

public class SimpleScreenSwitcher extends EventDispatcher implements IScreenSwitcher {
    public function SimpleScreenSwitcher() {
    }

    public function action(active:IScreen, next:IScreen):void {
        super.dispatchEvent(new Event(Event.COMPLETE));
    }
}
}
