package ru.gotoandstop.command {

/**
 *
 * @author Roman Timashev (roman@tmshv.ru)
 */
public interface ICommand {
    function execute(data:Object = null):void;
}
}