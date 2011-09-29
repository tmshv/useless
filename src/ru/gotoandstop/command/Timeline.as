package ru.gotoandstop.command{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 **/
	public class Timeline extends EventDispatcher{
		public function Timeline(){
			super();
		}
		
		public function addProcess(process:IProcess):IProcess{
			return null;
		}
		
		public function removeProcessAt(index:uint):void{
		}
		
		public function getCommandIndex(command:ICommand):int{
			return 0;
		}
		
		public function execute():void{
			
		}
	}
}