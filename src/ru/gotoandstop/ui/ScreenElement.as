/**
 *
 * User: tmshv
 * Date: 8/31/12
 * Time: 6:44 PM
 */
package ru.gotoandstop.ui {
import flash.events.Event;

import ru.gotoandstop.ui.Element;

public class ScreenElement extends Element{
    public function ScreenElement() {
        addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
    }

    private function handleAddedToStage(event:Event):void{
        removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
        onStage();
    }

    protected function onStage():void{

    }
}
}
