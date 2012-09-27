/**
 *
 * User: tmshv
 * Date: 8/31/12
 * Time: 6:44 PM
 */
package ru.gotoandstop.ui {
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;

import flashx.textLayout.operations.PasteOperation;

import ru.gotoandstop.ui.Element;

public class ScreenElement extends Element{
    public var loopEvent:String = Event.ENTER_FRAME;
    public var lastLoopEvent:Event;
    private var listeningLoopEvent:String;

    public function ScreenElement() {
        addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
    }

    private function handleAddedToStage(event:Event):void{
        removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
        onStage();
    }

    protected function onStage():void{

    }

    public function enableLoop():void{
        if(listeningLoopEvent) {
            listeningLoopEvent = loopEvent;
            addEventListener(listeningLoopEvent, handleLoopEvent);
        }
    }

    public function disableLoop():void{
        removeEventListener(listeningLoopEvent, handleLoopEvent);
        listeningLoopEvent = null;
    }

    private function handleLoopEvent(event:Event):void{
        lastLoopEvent = event;
        loop();
    }

    protected function loop():void{

    }

    public function enableClick():void{
        addEventListener(MouseEvent.CLICK, handleClick);
    }

    public function disableClick():void{
        removeEventListener(MouseEvent.CLICK, handleClick);
    }

    private function handleClick(event:MouseEvent):void {
        click(new Point(event.stageX, event.stageY))
    }

    protected function click(coord:Point):void{

    }
}
}
