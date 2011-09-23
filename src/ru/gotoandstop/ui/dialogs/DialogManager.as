package ru.gotoandstop.ui.dialogs{
	import ru.gotoandstop.mvc.BaseController;
	import ru.gotoandstop.mvc.IModel;
	
	import flash.display.DisplayObjectContainer;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class DialogManager extends BaseController implements IModel{
		private var dialogs:DialogsContainer;
		public override function get container():DisplayObjectContainer{
			return this.dialogs;
		}
		
		public function DialogManager(container:DisplayObjectContainer){
			super(container);
			this.init();
		}
		
		private function init():void{
			this.dialogs = new DialogsContainer(this);
			super.container.addChild(this.dialogs);
		}
		
		public function add(dialog:IDialog):IDialog{
			return dialog;
		}
		
		public function remove(dialog:IDialog):IDialog{
			return dialog;
		}
		
		public function update():void{
			
		}
	}
}