package ru.gotoandstop.screen{
	import ru.gotoandstop.command.ICommand;
	
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ActivateScreenSoftCommand implements ICommand{
		private var manager:ScreenMachine;
		private var key:String;
		
		public function ActivateScreenSoftCommand(manager:ScreenMachine, key:String){
			this.manager = manager;
			this.key = key;
		}
		
		public function execute():void{
			var screen:IScreen = this.manager.getScreen(this.key);
			if(screen){
				screen.activate();	
			}
		}
		
		public function undo():void{
			
		}
	}
}