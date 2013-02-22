package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

import ru.gotoandstop.values.NoValue;

/**
	 *
	 * creation date: Sep 26, 2011
	 * @author Roman Timashev (roman@tmshv.ru)
	 **/
	public class NumberValue extends NoValue{
		private var _value:Number;
		public function get value():Number{
			return _value;
		}
		public function set value(value:Number):void{
			_value = value;
			this.update();
		}
		
		public function NumberValue(value:Number=0){
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