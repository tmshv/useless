package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class StringValue extends EventDispatcher implements IValue{
		private var _name:String;
		public function get id():String{
			return this._name;
		}
		public function set id(value:String):void{
			this._name = value;
		}
		
		private var _value:String;
		public function get value():String{
			return this._value;
		}
		public function set value(value:String):void{
			this._value = value;
			this.update();
		}
		
		public function StringValue(value:String=''){
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
			var text:String = '[<value>]';
			text = text.replace(/<value>/, this.value);
			return text;
		}
	}
}