package ru.gotoandstop.math {
import flash.geom.Point;

/**
 * Static class for some trivial calculations
 * Supported since 2008
 * @author Roman Timashev (roman@tmshv.ru)
 */
public class Calculate {
    /**
     * Возвращает случайное число в заданном диапозоне
     * @param min
     * @param max
     * @param round
     * @return
     *
     */
    public static function random(min:Number = 0, max:Number = 1, round:Boolean = false):Number {
        return interpolate(min,  max,  Math.random(), round);
    }

    /**
     * Calculate linear interpolation between two numbers
     * @param min
     * @param max
     * @param ratio
     * @param round
     * @return
     */
    public static function interpolate(min:Number, max:Number, ratio:Number, round:Boolean = false):Number {
        var value:Number = min + ratio * (max - min);
        return round ? Math.round(value) : value;
    }

    /**
     * Возвращает расстояние между двумя точками
     * @param first
     * @param second
     * @return
     *
     */
    public static function distance(first:Point, second:Point):Number {
        return Math.sqrt(Calculate.distanceQuad(first, second));
    }

    /**
     * Возвращает квадрат расстояния между двумя точками
     * @param first
     * @param second
     * @return
     *
     */
    public static function distanceQuad(first:Point, second:Point):Number {
        var deltaX:Number = second.x - first.x;
        var deltaY:Number = second.y - first.y;
        return deltaX * deltaX + deltaY * deltaY;
    }

    /**
     * Возвращает угол между двумя точками в радианах
     * @param first
     * @param second
     * @return
     *
     */
    public static function angle(first:Point, second:Point):Number {
        return Math.atan2(second.y - first.y, second.x - first.x);
    }

    /**
     * Возвращает угол между двумя точками в градусах
     * @param first
     * @param second
     * @return
     *
     */
    public static function degree(first:Point, second:Point):Number {
        return Math.atan2(second.y - first.y, second.x - first.x) * (180 / Math.PI);
    }

    /**
     * Возвращает индекс ячейки
     * @param index
     * @param length
     * @return
     *
     */
    public static function cellIndex(index:uint, length:uint):Object {
        var r:uint = Math.floor(index / length);
        var c:uint = index - (r * length);

        return {column:c, row:r};
    }
}
}