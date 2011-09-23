package ru.gotoandstop.ui{
	
	import flash.display.DisplayObject;
	import flash.filters.ColorMatrixFilter;
	import ru.gotoandstop.IDisposable;
	
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class GroupController implements IDisposable{
		private var _active:DisplayObject;
		private var list:Vector.<DisplayObject>;
		
		public function GroupController(...items){
			this.list = new Vector.<DisplayObject>();
			
			for each(var item:DisplayObject in items){
				if(item is DisplayObject){
					this.add(item);
				}
			}
		}
		
		public function add(item:DisplayObject):void{
			this.list.push(item);
			//item.filters = [this.getFilter()];
		}
		
		public function select(item:DisplayObject):void{
			return;
			if(this._active){
				this._active.filters = [this.getFilter()];
			}
			
			trace('selected was', this._active)
			
			this._active = item;
			this._active.filters = [];
		}
		
		public function dispose():void{
			for each(var item:DisplayObject in list){
				item.filters = [];
			}
			this.list = null;
		}
		
		private function getFilter():ColorMatrixFilter{
			const value:Number = 0.6;
			return new ColorMatrixFilter([
				0, 0, value, 0, 0,
				0, 0, value, 0, 0,
				0, 0, value, 0, 0,
				0, 0, value, .65, 0
			]);
		}
	}
}