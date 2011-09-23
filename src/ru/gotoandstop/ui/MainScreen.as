package ru.gotoandstop.ui{
	import flash.display.DisplayObject;
	
	import ru.gotoandstop.command.ICommand;
	import ru.gotoandstop.screen.ActivateScreenSoftCommand;
	import ru.gotoandstop.screen.Screen;

	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class MainScreen extends Screen{
//		private var view:View;
		public function MainScreen(key:String){
			super(key);
			this.init();
		}
		
		private function init():void{
//			this.view = new View();
		}
		
//		public override function getView():DisplayObject{
//			return this.view;
//		}
		
		public override function enable():void{
//			var comm:ICommand = new ActivateScreenSoftCommand(super.machine, 'c');
//			super.temps.push(new ButtonController(this.view, comm));
//			super.enable();
		}
		//		
		public override function disable():void{
			super.clearTemps();
			super.disable();
		}
	}
}

//import ru.gotoandstop.lolwille.clips.CreateCharClip1;
//import ru.gotoandstop.lolwille.clips.MainScreenBackgroundClip;
//
//internal class View extends MainScreenBackgroundClip{
//	public function View(){
//		
//	}
//}