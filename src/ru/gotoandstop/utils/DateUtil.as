package ru.gotoandstop.utils{
	public class DateUtil{
		public static function hasDate(start:Date, end:Date, date:Date):Boolean{
			var time:Number = date.getTime();
			return time>start.getTime() && time<end.getTime();
		}
	}
}