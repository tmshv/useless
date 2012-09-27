package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class IntValue extends EventDispatcher implements IValue{
		private var _name:String;
		public function get id():String{
			return this._name;
		}
		public function set id(value:String):void{
			this._name = value;
		}
		
		private var _value:int;
		public function get value():int{
			return this._value;
		}
		public function set value(value:int):void{
			this._value = value;
			this.update();
		}
		
		public function IntValue(value:int=0){
			super();
			this.value = value;
		}
		
		public function update():void{
			super.dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function getValue():*{
			return this.value;
		}
		
		public function setValue(value:*):void{
			this.value = value;
		}
		
		public override function toString():String{
			var text:String = '[<int>]';
			text = text.replace(/<int>/, this.value);
			return text;
		}
	}
}