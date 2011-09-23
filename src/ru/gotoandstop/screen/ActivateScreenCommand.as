package ru.gotoandstop.screen{
	import ru.gotoandstop.command.ICommand;
	
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ActivateScreenCommand implements ICommand{
		private var screen:Screen2;
		
		public function ActivateScreenCommand(state:Screen2){
			this.screen = state;
		}
		
		public function execute():void{
			this.screen.activate();
		}
		
		public function undo():void{
			
		}
	}
}