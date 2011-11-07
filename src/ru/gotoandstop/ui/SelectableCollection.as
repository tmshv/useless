package ru.gotoandstop.ui{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 **/
	public class SelectableCollection extends EventDispatcher{
		public function SelectableCollection(){
			super();
		}
		
		public function addItem(item:ISelectable):void{
			
		}
		
		public function getSelected():Vector.<ISelectable>{
			return null;
		}
	}
}