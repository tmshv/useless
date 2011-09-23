package ru.gotoandstop.mvc{	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 *
	 * @author Timashev Roman
	 */
	public class BaseModel extends EventDispatcher implements IModel{
		protected var locked:Boolean;
		
		public function BaseModel(){
			super();
		}
		
		public function update():void{
			
		}
		
		protected function dispatch():void{
			if(!this.locked) this.update();
		}
		
		public function lock():void{
			this.locked = true;
		}
		
		public function unlock():void{
			this.locked = false;
		}
	}
}