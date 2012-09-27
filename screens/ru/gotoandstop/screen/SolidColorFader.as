/**
 *
 * User: tmshv
 * Date: 5/2/12
 * Time: 4:18 PM
 */
package ru.gotoandstop.screen {
import caurina.transitions.Tweener;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;
import flash.utils.setTimeout;

public class SolidColorFader extends Sprite implements IScreenSwitcher {
    public var timeIn:uint;
    public var transitionIn:String;

    public var timeOut:uint;
    public var transitionOut:String;

    public var pauseInOut:uint;
    public var automaticFadeOut:Boolean = true;

    private var _nextView:DisplayObject;

    public function SolidColorFader(color:uint, width:uint, height:uint, options:Object = null) {
        super.graphics.beginFill(color, 1);
        super.graphics.drawRect(0, 0, width, height);
        super.graphics.endFill();

        super.alpha = 0;
        super.mouseChildren = false;
        super.mouseEnabled = false;
        super.visible = false;

        options = options ? options : getDefaultOptions();
        timeIn = options.fadeTimeIn;
        transitionIn = options.fadeTransitionIn;
        timeOut = options.fadeTimeOut;
        transitionOut = options.fadeTransitionOut;
        pauseInOut = options.pauseInOut;
    }

    private function getDefaultOptions():Object {
        return {
            fadeTimeIn:1000,
            fadeTranstitionIn:"linear",
            fadeTimeOut:1000,
            fadeTranstitionOut:"linear",
            pauseInOut:0
        };
    }

    public function action(active:IScreen, next:IScreen):void {
        var can_work:Boolean;
        can_work = Boolean(next);
        if (active) {
            var same_parent:Boolean = active.machine == next.machine;
            can_work = can_work && same_parent;
        }

        if (can_work) {
            _nextView = next.getView();
            _nextView.visible = false;

            fadeIn(automaticFadeOut);
        } else {
            return;
        }
    }

    public function fadeIn(autoFadeOut:Boolean=true):void{
        automaticFadeOut = autoFadeOut;
        visible = true;
        Tweener.addTween(this, {
            time:timeIn / 1000,
            alpha:1,
            transition:transitionIn,
            onComplete:onTweenInComplete
        });
    }

    private function onTweenInComplete():void {
        super.dispatchEvent(new Event(Event.COMPLETE));
        _nextView.visible = true;

        if(automaticFadeOut) {
            if(pauseInOut) {
                setTimeout(fadeOut, pauseInOut);
            }else{
                fadeOut();
            }
        }
    }

    public function fadeOut():void{
        Tweener.addTween(this, {
            time:timeOut / 1000,
            alpha:0,
            transition:transitionOut,
            onComplete:onTweenOutComplete
        });
    }

    private function onTweenOutComplete():void {
        visible = false;
    }
}
}