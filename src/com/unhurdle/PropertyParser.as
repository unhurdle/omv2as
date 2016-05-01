package com.unhurdle
{
	public class PropertyParser
	{
		public function PropertyParser()
		{
		}
		static public function parse(xml:XML,static:Boolean):OMVProperty{
			var retVal:OMVProperty = new OMVProperty(xml);
			retVal.static = static;
			retVal.name = xml.@name;
			retVal.readOnly = xml.@rwaccess.length() && xml.@rwaccess.toString() == "readonly";
			retVal.enum = xml.@enumeration.length() && xml.@enumeration.toString() == "true";
			retVal.shortDescription = xml.shortdesc.toString();
			if(xml.description.length()){
				retVal.longDescription = xml.description.text();
			}
			if(xml.datatype.length()){
				retVal.type = OMVType.getType(xml.datatype.type.toString());
				retVal.value = xml.datatype.value;
			}
			return retVal;
		}
	}
}