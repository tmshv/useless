package ru.gotoandstop.screen{
	import ru.gotoandstop.command.ICommand;
	
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ActivateScreenCommand implements ICommand{
		private var screen:Screen;
		
		public function ActivateScreenCommand(state:Screen){
			this.screen = state;
		}
		
		public function execute():void{
			this.screen.activate();
		}
		
		public function undo():void{
			
		}
	}
}