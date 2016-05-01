package com.unhurdle.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	
	import spark.components.Alert;

	public class FileUtils
	{
		public function FileUtils()
		{
		}
		
		public static function getDocumentsFolderPath():String{
			return File.documentsDirectory.url;
		}
		public static function createFolder(path:String):Boolean{
			try{
				
			}catch(err:Error){
				return false;
			}
			var f:File = new File(path);
			if(!f.exists){
				f.createDirectory();
			}
			return true;
		}
		
		public static function getFileName(filePath:String):String{
			var name:String = "";
			try{
				var file:File = new File(filePath);
				name = file.name;
			}catch(err:Error){}
			return name;
		}
		public static function getFileFromPath(path:String):File{
			var file:File;
			//path = normalizeFilePath(path);
			try{
				file = new File(path);
				//addVolumeToFile(file);
			} catch (err:Error){}
			return file;
		}

		public static function writeUTFFile(path:String,contents:String,append:Boolean=false):Boolean{
			var file:File = new File(path);
			if(file.exists){
				trace("file exists");
			}
			try{
				var mode:String = FileMode.WRITE;
				if(append){
					mode = FileMode.APPEND;
				}
				var fs:FileStream = new FileStream();
				fs.open(file,mode);
				fs.writeUTFBytes(contents);
				fs.close();
			}catch (err:Error){
				return false;
			}
			return true;
		}
		public static function writeBinFile(path:String,bytes:ByteArray):Boolean{
			var file:File = new File(path);
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeBytes(bytes);
			stream.close();
			return true;
		}
		public static function readUTFFile(path:String):String{
			var file:File = new File(path);
			if(!file.exists){
				return "";
			}
			var fs:FileStream = new FileStream();
			fs.open(file,FileMode.READ);
			var contents:String = fs.readUTFBytes(fs.bytesAvailable);
			fs.close();
			return contents;
		}
		public static function readBinFile(path:String):ByteArray{
			var bytes:ByteArray;
			var file:File = new File(path);
			if (!file.exists) {return bytes}
			bytes = new ByteArray();
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			stream.readBytes(bytes);
			stream.close();
			return bytes;
		}

	}
}