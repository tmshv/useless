package ru.gotoandstop.mvc{
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 *
	 * @author Timashev Roman
	 */
	public class BaseController extends EventDispatcher implements IController{
		private var _container:DisplayObjectContainer;
		public function get container():DisplayObjectContainer{
			return this._container;
		}
		public function set container(value:DisplayObjectContainer):void{
			this._container = value;
		}
		
		public function BaseController(container:DisplayObjectContainer){
			super();
			this.container = container;
		}
	}
}