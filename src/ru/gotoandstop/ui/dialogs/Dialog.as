package ru.gotoandstop.ui.dialogs{
	import ru.gotoandstop.mvc.BaseController;
	import ru.gotoandstop.ui.UIElement;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	[Event(name="command", type="ru.gotoandstop.lolwille.ui.UICommandEvent")]

	/**
	 * Базовый класс-контроллер диалогового окна
	 * @author Timashev Roman
	 */
	public class Dialog extends UIElement implements IDialog{
		public function get clip():DisplayObject{
			return null;
		}
		protected var manager:DialogManager;
		
		public function Dialog(){
//			super(context.dialogManager.container, context);
//			this.manager = context.dialogManager;
		}
		
		protected function add():void{
			//this.manager.add(this);
		}
		
		public function close():void{
			
		}
	}
}