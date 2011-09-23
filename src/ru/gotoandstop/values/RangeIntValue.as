package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class RangeIntValue extends IntValue{
		public var maxValue:int;
		public var minValue:int;
		
		public override function set value(value:int):void{
			value = Math.max(value, this.minValue);
			super.value = Math.min(value, this.maxValue);
		}
		
		public function RangeIntValue(minValue:uint=0, maxValue:uint=0xffffff){
			super();
			this.maxValue = maxValue;
			this.minValue = minValue;
			this.value = this.minValue;
		}
		
		public function increase():void{
			this.value += 1;
		}
		
		public function decrease():void{
			this.value -= 1;
		}
		
		public function getRatio(fromZero:Boolean=false):Number{
			if(fromZero){
				return super.value / this.maxValue;
			}else{
				var f:int = this.maxValue - this.minValue;
				var v:int = super.value - this.minValue;
				return v/f;
			}
		}
		
		public function isEmpty():Boolean{
			return this.value == this.minValue;
		}
		
		public function isFull():Boolean{
			return this.value == this.maxValue;
		}
	}
}