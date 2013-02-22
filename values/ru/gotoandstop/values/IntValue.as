package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

import ru.gotoandstop.values.NoValue;

[Event(name="change", type="flash.events.Event")]
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class IntValue extends NoValue{
		private var _value:int;
		public function get value():int{
			return _value;
		}
		public function set value(value:int):void{
			_value = value;
			update();
		}
		
		public function IntValue(value:int=0){
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