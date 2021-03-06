/**
 *
 * User: tmshv
 * Date: 8/31/12
 * Time: 6:44 PM
 */
package ru.gotoandstop.ui {
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.MouseEvent;
import flash.geom.Point;

public class ScreenElement extends Element {
    public var loopEvent:String = Event.ENTER_FRAME;
    public var lastLoopEvent:Event;
    private var _listeningLoopEvent:String;
    private var _clickTarget:IEventDispatcher;

    public function get stageWidth():uint{
        return stage ? stage.stageWidth : 0;
    }

    public function get stageHeight():uint{
        return stage ? stage.stageHeight : 0;
    }

    public function ScreenElement() {
        addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
    }

    public function setBasicStageLayout(aling:String = StageAlign.TOP_LEFT, scale:String = StageScaleMode.NO_SCALE):void {
        if (stage) {
            stage.align = aling;
            stage.scaleMode = scale;
        }
    }

    private function handleAddedToStage(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);
        onStage();
    }

    protected function onStage():void {

    }

    public function enableLoop():void {
        if (loopEvent) {
            _listeningLoopEvent = loopEvent;
            addEventListener(_listeningLoopEvent, handleLoopEvent);
        }
    }

    public function disableLoop():void {
        if (hasEventListener(_listeningLoopEvent)){
            removeEventListener(_listeningLoopEvent, handleLoopEvent);
            _listeningLoopEvent = null;
        }
    }

    private function handleLoopEvent(event:Event):void {
        lastLoopEvent = event;
        loop();
    }

    protected function loop():void {

    }

    public function enableClick(targetIsStage:Boolean=false):void {
        _clickTarget = targetIsStage ? stage : this;
        if(_clickTarget) {
            _clickTarget.addEventListener(MouseEvent.CLICK, handleClick);
        }
    }

    public function disableClick():void {
        if(_clickTarget) {
            _clickTarget.removeEventListener(MouseEvent.CLICK, handleClick);
            _clickTarget = null;
        }
    }

    private function handleClick(event:MouseEvent):void {
        click(new Point(event.stageX, event.stageY))
    }

    protected function click(coord:Point):void {

    }
}
}
