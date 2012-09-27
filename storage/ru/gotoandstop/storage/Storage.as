/**
 * Created by IntelliJ IDEA.
 * User: tmshv
 * Date: 3/24/12
 * Time: 11:57 AM
 * To change this template use File | Settings | File Templates.
 */
package ru.gotoandstop.storage {
import flash.events.EventDispatcher;
import flash.utils.ByteArray;

public class Storage extends EventDispatcher {
    private var storage:Object;
    private var keys:Vector.<String>;

    public function Storage() {
        storage = new Object();
        keys = new Vector.<String>();
    }

    public function set(key:String, value:*):void {
        kill(key);
        storage[key] = value;
        keys.push(key);
    }

    public function get(key:String, defaultValue:* = null):* {
        var value:* = storage[key];
        return (value != null && value != undefined) ? value : (defaultValue ? defaultValue : null);
    }

    public function exist(key:String):Boolean {
        return storage[key] != undefined;//Boolean(storage[key]);
    }

    public function kill(key:String):void {
        delete storage[key];
        var index:int = keys.indexOf(key);
        if (index > -1) {
            keys.splice(index, 1);
        }
    }

    public function clear():void {
        storage = new Object();
    }

    public function getIndex(key:String):int {
        return keys.indexOf(key);
    }

    public function getByIndex(index:uint):* {
        var data:*;
        try {
            var key:String = keys[index];
            data = get(key);
        } catch (error:Error) {
            data = null;
        }

        return data;
    }

    public function setKeyIndex(key:String, index:uint):void{
        var key_index:int = keys.indexOf(key);
        if(key_index < 0) return;
        var right_part_of_list:Vector.<String> = keys.slice(index);
        keys.splice(key_index, 1);
        keys.splice(index, keys.length);
        for each (var k:String in right_part_of_list) {
            keys.push(k);
        }
    }

    public function match(pattr:Object):Array {
        var list:Array = new Array();
        for (var i:String in storage) {
            if (i.match(pattr)) {
                list.push(storage[i]);
            }
        }
        return list;
    }

    public function getKeyList():Vector.<String> {
        var list:Vector.<String> = new Vector.<String>();
        for (var i:String in storage) {
            list.push(i);
        }
        return list;
    }

    public function forEach(callback:Function):void{
        var list:Vector.<String> = getKeyList();
        for each(var key:String in list) {
            var item:Object = get(key);
            callback(item);
        }
    }

    public function getData():Object {
        var bytes:ByteArray = new ByteArray();
        bytes.writeObject(storage);
        bytes.position = 0;
        return bytes.readObject();
    }

    public function get length():uint {
        return keys.length;
    }
}
}
