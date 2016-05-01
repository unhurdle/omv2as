package com.unhurdle
{
	public class ParameterParser
	{
		public function ParameterParser()
		{
		}
		
		static public function parse(xml:XML):OMVParameter{
			var retVal:OMVParameter = new OMVParameter(xml);
			retVal.name = xml.@name;
			retVal.description = xml.shortdesc.text();
			retVal.type = OMVType.getType(xml.datatype.type.toString());
			retVal.optional = xml.@optional.length() && xml.@optional.toString() == "true";
			retVal.value = xml.datatype.value.toString();
			return retVal;
		}
	}
}