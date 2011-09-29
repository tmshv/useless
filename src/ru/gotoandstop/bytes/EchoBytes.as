package ru.gotoandstop.bytes{
	import flash.utils.ByteArray;
	
	/*
	Author: Timashev Roman
	Version: 1.1
	Date: 08.2009
	*/
	
	public class EchoBytes{
		public static function echoUTF(
			bytes:ByteArray,
			offset:uint=0,
			length:uint=0,
			rowLength:uint=0,
			stream:Boolean=true,
			group:uint=0
		):String{
			if(!bytes) throw new ArgumentError('Error #1507: Argument bytes connot be null.');
			if(offset >= bytes.length) return '';
			if((offset + length) >= bytes.length) length -= (offset + length - bytes.length);
			
			var bytesDelimiter:String = stream ? '' : ' ';
			var skip:uint = offset % rowLength;
			var result:String = EchoBytes.getFirstStringPrefix((skip * 2) + (bytesDelimiter.length * skip) + (bytesDelimiter.length * (skip % group)));
			var pos:uint = bytes.position;
			var byte:String;
			var i:uint = 1;
			bytes.position = offset;
			
			while(bytes.bytesAvailable){
				if(length && (i > length)) break;
				
				byte = bytes.readUTF();//bytes.readUnsignedByte().toString(16).toUpperCase();
				
				result += byte.length < 2 ? ('0' + byte) : byte;
				var last:Boolean = !(bytes.position % rowLength);
				
				result += rowLength && last ? '\n' : bytesDelimiter;
				result += group && !(i % group) && !last ? ' ' : '';
				
				i++;
			}
			
			bytes.position = pos;
			return result;
		}
		
		public static function echo(
			bytes:ByteArray,
			offset:uint=0,
			length:uint=0,
			rowLength:uint=0,
			stream:Boolean=true,
			group:uint=0
		):String{
			if(!bytes) throw new ArgumentError('Error #1507: Argument bytes connot be null.');
			if(offset >= bytes.length) return '';
			if((offset + length) >= bytes.length) length -= (offset + length - bytes.length);
			
			var bytesDelimiter:String = stream ? '' : ' ';
			var skip:uint = offset % rowLength;
			var result:String = EchoBytes.getFirstStringPrefix((skip * 2) + (bytesDelimiter.length * skip) + (bytesDelimiter.length * (skip % group)));
			var pos:uint = bytes.position;
			var byte:String;
			var i:uint = 1;
			bytes.position = offset;
			
			while(bytes.bytesAvailable){
				if(length && (i > length)) break;
											
				byte = bytes.readUnsignedByte().toString(16).toUpperCase();
				
				result += byte.length < 2 ? ('0' + byte) : byte;
				var last:Boolean = !(bytes.position % rowLength);
				
				result += rowLength && last ? '\n' : bytesDelimiter;
				result += group && !(i % group) && !last ? ' ' : '';
				
				i++;
			}
			
			bytes.position = pos;
			return result;
		}
		
		private static function getFirstStringPrefix(length:uint=0):String{
			var result:String = '';
			for(var i:uint; i < length; i++){
				result += ' ';
			}
			return result;
		}
	}
}