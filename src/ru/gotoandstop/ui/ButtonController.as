package ru.gotoandstop.ui{
	import flash.display.Sprite;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import ru.gotoandstop.command.ICommand;
	import ru.gotoandstop.IDisposable;
	
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class ButtonController implements IDisposable{
		private var target:IEventDispatcher;
		private var command:ICommand;
		
		public function ButtonController(target:IEventDispatcher, command:ICommand){
			this.command = command;
			this.target = target;
			
			this.target.addEventListener(MouseEvent.CLICK, this.handleClick);
		}
		
		private function handleClick(event:MouseEvent):void{
			this.command.execute({
                x:event.localX,
                y:event.localY,
                stageX:event.stageX,
                stageY:event.stageY,
                alt:event.altKey,
                ctr:event.ctrlKey,
                shift:event.shiftKey
            });
		}
		
		public function dispose():void{
			this.target.removeEventListener(MouseEvent.CLICK, this.handleClick);
		}
	}
}