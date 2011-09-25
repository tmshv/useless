package ru.gotoandstop.utils{
	import flash.geom.Rectangle;

	/**
	 * Date: 2007
	 * @author Roman Timashev (roman@tmshv.ru)
	 * @verion: 3.0
	 */
	public class Convert{
		public static function correctRectangle(rectangle:Rectangle):Rectangle{
			var result:Rectangle;
			if(rectangle.width < 0){
				var w:Number = Math.abs(rectangle.width);
				var r:Number = rectangle.right;
				rectangle.x = r;
				rectangle.width = w;
			}
			if(rectangle.height < 0){
				var h:Number = Math.abs(rectangle.height);
				var b:Number = rectangle.bottom;
				rectangle.y = b;
				rectangle.height = h;
			}
			return rectangle;
		}
		
		//
		/**
		 * Конвертирует строку в булево
		 * false: пустая строка, 0, false, off, no 
		 * @param string
		 * @param strict
		 * @return 
		 * 
		 */
		public static function stringToBoolean(string:String, strict:Boolean=false):Boolean{
			if(!strict){
				if(string == '') return false;
				else if(string == '0')		return false;
				else if(string == 'false')	return false;
				else if(string == 'off')	return false;
				else if(string == 'no')		return false;
				else return true;
			}else{
				if(string == '')			return false;
				else if(string == '1')		return true;
				else if(string == '0')		return false;
				else if(string == 'true')	return true;
				else if(string == 'false')	return false;
				else if(string == 'on')		return true;
				else if(string == 'off')	return false;
				else if(string == 'yes')	return true;
				else if(string == 'no')		return false;
				else return false;
			}
		}

		//Возвращает сткоку заданной длины
		public static function numberToString(number:int, radix:uint=10, length:uint=0, upperCase:Boolean=true):String{
			var result:String = '';
			var string:String = number.toString(radix);
			var d:int = length - string.length;
			
			for(var i:uint; i < d; i++){
				result += '0';
			}
			
			result += string;
			if(upperCase) result.toUpperCase();
			return result;
		}
		
		//
		public static function toUniqueURL(url:String):String{
			trace("Convert.toUniqueURL: I'm shitty!")
			return url + '?time=' + (new Date().getTime());
		}
		
		//Конвертирует градусы в радианы
		public static function degreeToRadian(degree:Number):Number{
			return degree * (Math.PI / 180);
		}
	
		//Конвертирует радианы в градусы
		public static function radianToDegree(radian:Number):Number{
			return radian * (180 / Math.PI);
		}
	
		//Разбивает RGB на составляющие
		public static function breakRGB(rgb:Number):Object{
			var r:Number = rgb >> 16;
			var g:Number = rgb >> 8 & 0xFF;
			var b:Number = rgb & 0xFF;
			
			return {r:r, g:g, b:b};
		}
		
		//Собирает RGB из трех составляющих
		public static function makeRGB(r:Number, g:Number, b:Number):Number{
			return r << 16 | g << 8 | b;
		}
	
		//Конвертирует RGB в HSB
		public static function RGBToHSB(color:uint):Object{
			var rgb:Object = Convert.breakRGB(color);
			var r:uint = rgb.r;
			var g:uint = rgb.g;
			var b:uint = rgb.b;
			var max:Number = Math.max(Math.max(r, g), b);
			var min:Number = Math.min(Math.min(r, g), b);
			
			var hsb_h:Number;
			if(max==r && min==b) hsb_h = 60 * (g - b) / (max - min);
			else if(max==r && min==g) hsb_h = 60 * (g - b) / (max - min) + 360;
			else if(max==g) hsb_h = 60 * (b - r) / (max - min) + 120;
			else if(max==b) hsb_h = 60 * (r - g) / (max - min) + 240;
			
			if(r==g && g==b && b==r) hsb_h = 0;
			
			var hsb_s:uint;
			if(max != 0) hsb_s = Math.round((1 - min / max) * 100);
			else hsb_s = 0;
			
			var hsb_b:uint = Math.round(max / 0xFF * 100);
			hsb_h = Math.round(hsb_h);
			return {h:hsb_h, s:hsb_s, b:hsb_b};
		}
	
		//Конвертирует HSB в RGB
		public static function HSBToRGB(h:Number, s:Number, v:Number):Object{
			var r:Number;
			var g:Number;
			var b:Number;
		
			h = Math.round(h);
			s = Math.round(s * 0xFF / 100);
			v = Math.round(v * 0xFF / 100);
			
			if(s == 0) {
				r = g = b = v;
			}else{
				var t1:Number = v;	
				var t2:Number = (0xFF - s) * v / 0xFF;	
				var t3:Number = (t1 - t2) * (h % 60) / 60;
			
				if(h == 360){
					h = 0;
				}
				
				if(h < 60){
					r = t1;
					b = t2;
					g = t2 + t3;
				}else if(h < 120){
					g = t1;
					b = t2;
					r = t1 - t3;
				}else if(h < 180){
					g = t1;
					r = t2;
					b = t2 + t3;
				}else if(h < 240){
					b = t1;
					r = t2;
					g = t1 - t3;
				}else if(h < 300){
					b = t1;
					g = t2;
					r = t2 + t3;
				}else if(h < 360){
					r = t1;
					g = t2;
					b = t1 - t3;
				}else{
					r = 0;
					g = 0;
					b = 0;
				}
			}
			
			r = Math.round(r);
			g = Math.round(g);
			b = Math.round(b);
			
			return {r:r, g:g, b:b};
		}
	}
}