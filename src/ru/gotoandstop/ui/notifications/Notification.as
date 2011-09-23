package ru.gotoandstop.ui.notifications{
	import flash.display.DisplayObject;
	
	/**
	 * Абстрактный класс оповещения. Может быть только наследован
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class Notification implements INotification{
		public function Notification(){
			
		}
		
		public function show():void{
			
		}
		
		public function hide():void{
			
		}
		
		public function getView():DisplayObject{
			return null;
		}
	}
}