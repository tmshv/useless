/**
 *
 * User: tmshv
 * Date: 4/23/12
 * Time: 9:07 PM
 */
package ru.gotoandstop.ui {
import flash.display.DisplayObject;
import flash.display.Sprite;

public class Element extends Sprite implements IElement {
    public function Element() {
        super();
    }

    public function get(key:String):Element {
        var names:Array = key.split(".");
        if (names.length > 1) {
            var first:Element = get(names[0]);
            return first.get(names.slice(1).join("."));
        } else {
            var object:DisplayObject = super.getChildByName(key);
            if (object) {
                return object as Element;
            } else {
                return add(key, new Element());
            }
        }
    }

    public function element(key:String, options:Object = null):Element {
        var elem:Element = get(key);
        if (options) {
            var index:uint = options.index;
            delete options.index;

            for (var i:String in options) {
                elem[i] = options[i];
            }
        }
        return elem;
    }

    protected function add(key:String, object:Element):Element {
        super.addChild(object);
        object.name = key;
        return  object;
    }

    public function push(object:DisplayObject, options:Object = null):Element {
        if (options) {
            for (var i:String in options) {
                object[i] = options[i];
            }
        }
        object.name = "";
        super.addChild(object);
        return this;
    }

    private function sortElement(elem:Element, index:uint):void {
         var p:Element = elem.parent as Element;

    }
}
}