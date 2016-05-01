package com.unhurdle
{
	import com.unhurdle.utils.FileUtils;
	
	import flash.filesystem.File;

	public class OMVReader
	{
		public function OMVReader(file:File)
		{
			_file=file;
		}
		static public function getClass(name:String):OMVClass{
			for(var i:int=0;i<_omvClasses.length;i++){
				if(_omvClasses[i].name == name){
					return _omvClasses[i];
				}
			}
			return null;
		}
		static private var _omvClasses:Array;
		private var _file:File;
		private var _classArray:Array;
		public function parseFile():void{
			var i:int;
			var len:int;
			var fileStr:String = FileUtils.readUTFFile(_file.url);
			var fileXML:XML = new XML(fileStr);
			var classes:XMLList = fileXML..classdef;
			
			len = classes.length();
			_classArray = [];
			trace(classes.length());
			for(i=0;i<len;i++){
				_classArray.push(ClassParser.parse(classes[i]));
			}
			_omvClasses = _classArray;
		}

		public function get classArray():Array
		{
			return _classArray;
		}

	}
}