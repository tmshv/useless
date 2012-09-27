package ru.gotoandstop.command {
/**
 *
 * @author Roman Timashev (roman@tmshv.ru)
 */
public class MacroCommand implements IMacroCommand {
    private var commands:Vector.<ICommand>;
    private var current:uint;

    public function MacroCommand() {
        super();
        this.commands = new Vector.<ICommand>();
    }

    public function addCommand(command:ICommand):ICommand {
        this.commands.push(command);
        return command;
    }

    public function removeCommandAt(index:uint):void {
        this.commands.splice(index, 1);
    }

    public function getCommandIndex(command:ICommand):int {
        return this.commands.indexOf(command);
    }

    public function execute(data:Object = null):void {
        this.current = 0;
        this.executeNext(data);
    }

    private function executeNext(data:Object):void {
        var complete_executing:Boolean = (this.current >= this.commands.length);
        if (!complete_executing) {
            var command:ICommand = this.commands[this.current];
            if (command) {
                command.execute(data);
                this.doAfterExecuting(data);
            } else {
//					this.isWorking = false;
            }
        }
    }

    private function doAfterExecuting(data:Object):void {
        this.current++;
        this.executeNext(data);
    }

//		public function undo():void{
//			this.current = this.commands.length - 1;
//		}
}
}