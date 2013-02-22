package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;

import ru.gotoandstop.values.NoValue;

/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class StringValue extends NoValue{
		private var _value:String;
		public function get value():String{
			return _value;
		}
		public function set value(value:String):void{
			_value = value;
			update();
		}
		
		public function StringValue(value:String = ""){
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