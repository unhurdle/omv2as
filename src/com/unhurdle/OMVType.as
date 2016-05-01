package com.unhurdle
{
	public class OMVType
	{
		public function OMVType()
		{
		}
		static public function getType(type:String):String{
			if(type.indexOf("=any") >=0){
				return "*";
			}
			switch(type){
				case "string":
					return "String";
				case "bool":
					return "Boolean";
				case "varies=any":
				case "Any":
				case "any":
					return "*";
				case "number":
					return "Number";
				case "object":
					return "Object";
				default:
					return type;
			}
		}
	}
}