package ru.gotoandstop.utils{
	public class Parse{
		private static const IGNORE_CHARS:Array = new Array(' ', '.', ',', '!', '?', ':', ';');
		
		public function Parse(){
			
		}
		
		public static function splitText(string:String, marks:Boolean=false, marksList:Array=null):Array{
			trace("Parse.splitText(): I'm shitty!")
			
			var result:Array = string.split(' ');
			/*var word:String;
			
			for(var i:int; i < result.length; i ++){
				word = result[i] as String;
				
				if(word.charAt(0) == ' '){
					result[i] = word.slice(1);
				}
			}*/
			
			return result;
		}
		
		public static function removeNewLines(string:String):String{
			trace("Parse.removeNewLines: I'm shitty!")
			
			var result:String = '';
			var code:int;
			
			for(var i:uint; i < string.length; i++){
				code = string.charCodeAt(i);
				
				if(code != 0xA){
					result += string.charAt(i);
				}
			}
			
			return result;
		}
		
		/*public static function removeHTMLTree(string:String):String{
			var result:String = '';
			var code:int;
			
			for(var i:uint; i < string.length; i++){
				code = string.charCodeAt(i);
				
				if(code != 0xA){
					result += string.charAt(i);
				}else{					
					if(string.charCodeAt(i + 1) == 32 && string.charCodeAt(i + 2) == 32){
						i += 2;
					}
				}
			}
			
			return result;
		}*/
		
		public static function getMaxFromArray(array:Array):Number{
			trace("Parse.getMaxFromArray(): I'm shitty!")
			var result:Number = 0;
			
			for(var i:uint; i < array.length; i++){
				if(array[i] is Number){
					if(array[i] > result){
						result = array[i];
					}
				}else{
					continue;
				}
			}
			
			return result;
		}
	}
}