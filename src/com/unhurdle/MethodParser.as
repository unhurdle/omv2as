package com.unhurdle
{
	public class MethodParser
	{
		public function MethodParser()
		{
		}
		static public function parse(xml:XML,static:Boolean):OMVMethod{
			var retVal:OMVMethod = new OMVMethod(xml);
			retVal.static = static;
			retVal.name = xml.@name;
			retVal.shortDescription = xml.@shortdesc;
			if(xml.description.length()){
				retVal.longDescription = xml.description.text();
			}
			if(xml.datatype.length()){
				retVal.returnType = OMVType.getType(xml.datatype.type.toString());
				if(xml.datatype.value.length()){
					// not doing anything here
				}
			}
			if(xml.parameters.length()){
				var params:XMLList = xml.parameters.parameter;
				var i:int;
				var len:int;
				for(i=0;i<len;i++){
					retVal.parameters.push(ParameterParser.parse(params[i]));
				}
			}
			return retVal;
		}
		
	}
}