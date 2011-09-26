package ru.gotoandstop.geom{
	import flash.geom.Point;

	/**
	 * 
	 * @author user
	 * @version 2.0
	 * @playerversion 9
	 */
	public class Vector2D extends Object{
		private var _x:Number;
		public function get x():Number{
			return this._x;
		}
		public function set x(value:Number):void{
			this._x = value;
			this._length = Math.sqrt(this._x*this._x + this._y*this._y);
		}
		
		private var _y:Number;
		public function get y():Number{
			return this._y;
		}
		public function set y(value:Number):void{
			this._y = value;
			this._length = Math.sqrt(this._x*this._x + this._y*this._y);
		}
		
		private var _length:Number;
		public function get length():Number{
			return this._length;
		}		
		public function set length(value:Number):void{
			this._length = value;
			this._x = Math.cos(direction) * value;
			this._y = Math.sin(direction) * value;
		}
		
		private var _direction:Number;
		public function get direction():Number{
			return Math.atan2(this._y, this._x);
		}
		public function set direction(value:Number):void{
			this._x = Math.cos(value) * this._length;
			this._y = Math.sin(value) * this._length;
		}
		
		public function get directionDegree():Number{
			return direction / (Math.PI / 180);
		}
		
		public function Vector2D(x:Number=0, y:Number=0){
			this._x = x;
			this._y = y;
			this._length = Math.sqrt(x*x + y*y);
		}
		
		public function position(x:Number, y:Number):void{
			this._x = x;
			this._y = y;
			this._length = Math.sqrt(x*x + y*y);
		}
		
		public function normilize():void{
			if(length){
				this.x /= length;
				this.y /= length;
			}
		}
		
		public function add(v:Vector2D):void{
			this._x += v.x;
			this._y += v.y;
			this._length = Math.sqrt(x*x + y*y);
		}
		
		public function subtract(v:Vector2D):void{
			this._x -= v.x;
			this._y -= v.y;
			this._length = Math.sqrt(x*x + y*y);
		}
		
		public function multiply(i:Number):void{
			this._x *= i;
			this._y *= i;
			this._length = Math.sqrt(x*x + y*y);
		}
		
		public function getVectorProjectionOnto(v:Vector2D):Vector2D{
			var result:Vector2D = v.unit;
			result.multiply(getScalarProjectionOnto(v));
			return result;
		}
		
		public function getScalarProjectionOnto(v:Vector2D):Number{
			return getDotProduct(v) / v.length; 
		}
		
		public function getDotProduct(v:Vector2D):Number{
			return x*v.x + y*v.y;
		}

		public function clone():Vector2D{
			return new Vector2D(this._x, this._y);
		}
		
		public function toString():String{
			return 'x=' + this._x.toString() + ', y=' + this._y.toString();
		}
		
		public function getLengthQuad():Number{
			return this._x*this._x + this._y*this._y;
		}
		
		public function get unit():Vector2D{
			var result:Vector2D = clone();
			if(length){
				result.x /= length;
				result.y /= length;
			}
			return result;
		}
	}
}