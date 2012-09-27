/**
 *
 * User: tmshv
 * Date: 4/28/12
 * Time: 5:25 PM
 */
package ru.gotoandstop.screen {
import flash.display.DisplayObject;

import ru.gotoandstop.screen.events.ScreenEvent;

public class SimpleScreen extends Screen{
    private var definition:Object;
    private var view:DisplayObject;

    public function SimpleScreen(key:String, definition:Object) {
        super(key);
        this.definition = definition;
        super.addEventListener(ScreenEvent.HIDED, handleHided);
    }

    override public function enable():void {
        if(definition is Class) {
            var Def:Class = definition as Class;
            view = new Def();
        }
        super.enable();
    }

    override public function getView():DisplayObject {
        return view;
    }

    private function handleHided(event:ScreenEvent):void{
        view = null;
    }

    override public function dispose():void {
        super.removeEventListener(ScreenEvent.HIDED, handleHided);
        super.dispose();
    }
}
}
