package ru.gotoandstop.values{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 *
	 * creation date: Sep 26, 2011
	 * @author Roman Timashev (roman@tmshv.ru)
	 **/
	public class NumberValue extends EventDispatcher implements IValue{
		private var _name:String;
		public function get id():String{
			return this._name;
		}
		public function set id(value:String):void{
			this._name = value;
		}
		
		private var _value:Number;
		public function get value():Number{
			return this._value;
		}
		public function set value(value:Number):void{
			this._value = value;
			this.update();
		}
		
		public function NumberValue(value:Number=0){
			super();
			this.value = value;
		}
		
		public function getValue():*{
			return this.value;
		}
		
		public function setValue(value:*):void{
			this.value = value;
		}
		
		public function update():void{
			super.dispatchEvent(new Event(Event.CHANGE));
		}
		
		public override function toString():String{
			var text:String = '[<number>]';
			text = text.replace(/<number>/, this.value);
			return text;
		}
	}
}