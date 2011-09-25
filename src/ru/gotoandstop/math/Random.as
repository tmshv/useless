package ru.gotoandstop.math{
	
	/*
	*
	* @author Timashev Roman
	* @version 1.1
	*/
	public class Random{
		private static const M:uint = 0x7FFFFFFF;//0x3B9ACA00;//Модуль, 0 < M
		private static const A:uint = 69621;//78939;//Множитель, 0 ≤ A < M
		private static const C:uint = 0;//1374671;//Приращение, 0 ≤ C < M
		
		private static var _x:Number;
		public static function get x():Number{
			return Random._x;
		}
		
		public function Random(){
			//X(n+1) = (AXn + C) Mod M, n ≥ 0
			
			//i		Числа С и M взаимно простые
			//ii	B = A - 1 кратно P для каждого простого P, являющегося делителем M
			//iii	B кратно 4, если M кратно 4
		}
		
		public static function sequence(start:uint, length:uint=1):Array{
			if(!length) return null;
			var x:uint = start;
			var list:Array = new Array();
			for(var i:uint; i < length; i++){
				x = (Random.A * x + Random.C) % Random.M;
				list.push(x / Random.M);
			}
			
			return list;
		}
		
		public static function start(value:Number):void{
			Random._x = value;
		}
		
		public static function read():Number{
			var value:Number = (Random.A * Random._x + Random.C) % Random.M;
			Random._x = value;
			return value / Random.M;
		}
	}
}