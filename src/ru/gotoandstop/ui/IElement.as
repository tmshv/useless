/**
 *
 * User: tmshv
 * Date: 2/15/13
 * Time: 7:00 PM
 */
package ru.gotoandstop.ui {
import flash.display.DisplayObject;

public interface IElement {
    function element(key:String, options:Object = null):Element;

    function push(object:DisplayObject, options:Object = null):Element;
}
}
