package ru.gotoandstop.mvc{
	import flash.display.Sprite;
	
	/**
	 *
	 * @author Timashev Roman
	 */
	public class BaseView extends Sprite{// implements IView, IContextDependent{
		private var _model:IModel;
		public function get model():IModel{
			return this._model;
		}
		
		public function BaseView(model:IModel){
			super();
			this._model = model;
		}		
	}
}