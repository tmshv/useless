package ru.gotoandstop.ui.notifications{
	import flash.display.Sprite;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class NotificationContainer extends Sprite{
		private static var _inst:NotificationContainer;
		public static function get instance():NotificationContainer{
			if(!NotificationContainer._inst){
				NotificationContainer._inst = new NotificationContainer();
			}
			return NotificationContainer._inst;
		}
		
		public function NotificationContainer(){
			
			super();
		}
	}
}