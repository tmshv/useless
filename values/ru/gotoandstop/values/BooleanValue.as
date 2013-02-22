package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

import ru.gotoandstop.values.NoValue;

/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class BooleanValue extends NoValue{
		private var _value:Boolean;
		public function get value():Boolean{
			return _value;
		}
		public function set value(value:Boolean):void{
			_value = value;
			update();
		}
		
		public function BooleanValue(value:Boolean=false){
			super();
			this.value = value;
		}
		
		public override function getValue():*{
			return value;
		}
		
		public override function setValue(value:*):void{
			this.value = value;
		}
    }
}