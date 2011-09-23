package ru.gotoandstop.ui{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	
	import ru.gotoandstop.command.ICommand;
	
	/**
	 *
	 * @author Roman Timashev (roman@tmshv.ru)
	 */
	public class SliderButtonsController{
		private var next:ICommand;
		private var prev:ICommand;
		private var commandByButton:Dictionary;
		
		public function SliderButtonsController(next:ICommand, prev:ICommand){
			this.next = next;
			this.prev = prev;
			this.commandByButton = new Dictionary();
		}
		
		public function init(next:DisplayObject, prev:DisplayObject, status:TextField):void{
			this.commandByButton[next] = this.next;
			this.commandByButton[prev] = this.prev;
			
			this.createListeners(next);
			this.createListeners(prev);
		}
		
		private function createListeners(button:IEventDispatcher):void{
			button.addEventListener(Event.REMOVED_FROM_STAGE, this.handleRemovedFromStage);
			button.addEventListener(MouseEvent.CLICK, this.handleClick);
		}
		
		private function removeListeners(button:IEventDispatcher):void{
			button.removeEventListener(Event.REMOVED_FROM_STAGE, this.handleRemovedFromStage);
			button.removeEventListener(MouseEvent.CLICK, this.handleClick);
		}
		
		private function handleRemovedFromStage(event:Event):void{
			this.removeListeners(event.target as IEventDispatcher);
		}
		
		private function handleClick(event:MouseEvent):void{
			const cmd:ICommand = this.commandByButton[event.currentTarget] as ICommand;
			if(cmd) cmd.execute();
		}
	}
}