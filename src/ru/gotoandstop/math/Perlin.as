package ru.gotoandstop.math{
	public class Perlin{
//		public static function noise(x:Number, y:Number=0):Number{
//			var total:Number = 0;
//			var p:Number = 0.25;
//			var n:Number = 3;
//			for(var i:uint; i<=n; i++){
//				var frequency:Number = Math.pow(2, i);
//				var amplitude:Number = Math.pow(p, i);
//				total += interpolatedNoise(x*frequency, y*frequency) * amplitude;
//			}
//			return total;
//		}
//		
//		private static function interpolatedNoise(x:Number, y:Number):Number{
//			var integer_X:Number = Math.floor(x);
//			var fractional_X:Number = x - integer_X;
//			var integer_Y:Number = Math.floor(y);
//			var fractional_Y:Number = y - integer_Y;
//			var v1:Number = smoothedNoise(integer_X, integer_Y);
//			var v2:Number = smoothedNoise(integer_X + 1, integer_Y);
//			var v3:Number = smoothedNoise(integer_X, integer_Y + 1);
//			var v4:Number = smoothedNoise(integer_X + 1, integer_Y + 1);
//			var i1:Number = interpolate(v1 , v2 , fractional_X);
//			var i2:Number = interpolate(v3 , v4 , fractional_X);
//			return interpolate(i1 , i2 , fractional_Y);
//		}
//		
//		private static function smoothedNoise(x:Number, y:Number):Number{
//			var corners:Number = (_noise(x-1, y-1) + _noise(x+1, y-1) + _noise(x-1, y+1) + _noise(x+1, y+1)) / 16;
//			var sides:Number = (_noise(x-1, y) + _noise(x+1, y) + _noise(x, y-1) + _noise(x, y+1)) / 8;
//			var center:Number = _noise(x, y) / 4;
//			return corners + sides + center;
//		}
//		
//		private static function _noise(x:Number, y:Number):Number{
//			var n:Number = x + y * 57;
//			n = (n<<13) ^ n;
//			return Math.abs(1.0 - (((n * ((n * n * 15731) + 789221) + 1376312589) & 0x7fffffff) / 1073741824));
//		}
//		
//		private static function interpolate(a:Number, b:Number, x:Number):Number{
//			var ft:Number = x * Math.PI;
//			var f:Number = (1 - Math.cos(ft)) * .5;
//			return  a*(1-f) + b*f;
//		}


//1 Dimension
//im louly
		public static function noise(x:Number=0, persistance:Number=1, numOct:uint=3):Number{
			var result:Number = 0;
			//var n:uint = numOct + 1;//-
			for(var i:uint; i<=numOct; i++){
				var frequency:Number = Math.pow(2, i);
				var amplitude:Number = Math.pow(persistance, i);
				result += Perlin.interpolatedNoise(x * frequency) * amplitude;
			}
			return result;
		}
		
		private static function noise1D(x:int):Number{
			x = (x<<13) ^ x;
			return (1 - ((x * (x*x*15731 + 789221) + 1376312589) & 0x7fffffff) / 1073741824);
		}
		
		private static function smoothedNoise(x:int):Number{
			return Perlin.noise1D(x)/2 + Perlin.noise1D(x-1)/4 + Perlin.noise1D(x+1)/4;
		}
		
		private static function interpolatedNoise(x:Number):Number{
			var integer_x:int = x;
			var fractional_x:Number = x - integer_x;
			var v1:Number = Perlin.smoothedNoise(integer_x);
			var v2:Number = Perlin.smoothedNoise(integer_x + 1);
			return Perlin.cosineInterpolate(v1, v2, fractional_x);
		}

//2 Dimension
		public static function noise2(x:Number, y:Number, persistence:Number=1, numOct:uint=1):Number{
			var result:Number = 0;
			var n:uint = numOct - 1;
			for(var i:uint; i<n; i++){
				var frequency:Number = Math.pow(2, i);
				var amplitude:Number = Math.pow(persistence, i);
				result += Perlin.interpolatedNoise2(x*frequency, y*frequency) * amplitude;
			}
			return result;
		}
		
		private static function noise2D(x:int, y:int):Number{
			var n:int = x + y * 57;
			n = (n<<13) ^ n;
			return (1 - ((n*(n*n*15731 + 789221) + 1376312589) & 0x7fffffff) / 1073741824);
		}
		
		private static function smoothedNoise2(x:Number, y:Number):Number{
			var corners:Number = (
				Perlin.noise2D(x-1, y-1) +
				Perlin.noise2D(x+1, y-1) +
				Perlin.noise2D(x-1, y+1) +
				Perlin.noise2D(x+1, y+1)
			) / 16;
			var sides:Number = (
				Perlin.noise2D(x-1, y) +
				Perlin.noise2D(x+1, y) +
				Perlin.noise2D(x, y-1) +
				Perlin.noise2D(x, y+1)
			) / 8;
			var center:Number = Perlin.noise2D(x, y) / 4;
			return corners + sides + center;
		}
		
		private static function interpolatedNoise2(x:Number, y:Number):Number{
			var integer_x:int = x;
			var integer_y:int = y;
			var fractional_x:Number = x - integer_x;
			var fractional_y:Number = y - integer_y;
			var v1:Number = Perlin.smoothedNoise2(integer_x, integer_y);
			var v2:Number = Perlin.smoothedNoise2(integer_x + 1, integer_y);
			var v3:Number = Perlin.smoothedNoise2(integer_x, integer_y + 1);
			var v4:Number = Perlin.smoothedNoise2(integer_x + 1, integer_y + 1);
			var i1:Number = Perlin.linearInterpolate(v1, v2, fractional_x);
			var i2:Number = Perlin.linearInterpolate(v3, v4, fractional_x);
			return Perlin.linearInterpolate(i1, i2, fractional_y);
		}
		
//common
		private static function linearInterpolate(a:Number, b:Number, x:Number):Number{
			return  a*(1-x) + b*x;
		}
		
		private static function cosineInterpolate(a:Number, b:Number, x:Number):Number{
			var ft:Number = x * Math.PI;
			var f:Number = (1 - Math.cos(ft)) * .5;
			return  a*(1-f) + b*f;
		}
		
		//v0 = the point before a
		//v1 = the point a
		//v2 = the point b
		//v3 = the point after b
		//private static function cubic_Interpolate(v0:Number, v1:Number, v2:Number, v3:Number, x:Number):Number{
		//	var P = (v3 - v2) - (v0 - v1);
		//	var Q = (v0 - v1) - P;
		//	var R = v2 - v0;
		//	var S = v1;
		//	return Px3 + Qx2 + Rx + S;
		//}
	}
}