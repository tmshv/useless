package ru.gotoandstop.mvc{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 *
	 * @author Timashev Roman
	 */
	public class BaseView extends Sprite implements IView{
		protected var locked:Boolean;
		
		private var _model:IModel;
		public function get model():IModel{
			return this._model;
		}
		
		public function BaseView(model:IModel){
			super();
			this._model = model;
		}
		
		public function get view():DisplayObject{
			return this;
		}
		
		public function lock():void{
			this.locked = true;
		}
		
		public function unlock():void{
			this.locked = false;
		}
		
		public function get isLocked():Boolean{
			return this.locked;
		}
		
		public function dispose():void{
			this._model = null;
		}
	}
}