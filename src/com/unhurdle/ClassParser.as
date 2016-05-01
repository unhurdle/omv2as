package com.unhurdle
{
	public class ClassParser
	{
		public function ClassParser()
		{
		}
		static public function parse(classXML:XML):OMVClass{
			var retVal:OMVClass = new OMVClass(classXML);
			retVal.name = classXML.@name;
			retVal.dynamic = classXML.@dynamic.toString() == "true";
			retVal.enum = classXML.@enumeration.toString() == "true";
			retVal.shortDescription = classXML.shortdesc.toString();
			if(classXML.description.length()){
				retVal.longDescription = classXML.description.toString();
			}
			if(classXML.superclass.length()){
				retVal.superclass = classXML.superclass.text();
			}
			var elems:XMLList = classXML.elements;
			var i:int;
			var len:int = elems.length();
			for(i=0;i<len;i++){
				switch(elems[i].@type.toString()){
					case "constructor":
						parseConstructor(elems[i],retVal);
						break;
					case "class":
						parseStaticElements(elems[i],retVal);
						break;
					case "instance":
						parseInstanceElements(elems[i],retVal);
						break;
				}
			}
			return retVal;
		}
		
		static private function parseConstructor(xml:XML,classObj:OMVClass):void{
			xml = xml.method[0];
			classObj.constructorShortDescription = xml.shortdesc.toString();
			if(xml.description.length()){
				// needs examination
				classObj.longDescription = xml.description.text();
			}
			if(xml.parameters.length()){
				var params:XMLList = xml.parameters.parameter;
				var i:int;
				var len = params.length();
				for(i=0;i<len;i++){
					classObj.constructorParams.push(ParameterParser.parse(params[i]))
				}
			}
		}
		static private function parseStaticElements(xml:XML,classObj:OMVClass):void{
			var i:int;
			var len:int;
			var properties:XMLList = xml.property;
			len = properties.length();
			for(i=0;i<len;i++){
				classObj.classProperties.push(PropertyParser.parse(properties[i],true));
			}
			var methods:XMLList = xml.method;
			len = methods.length();
			for(i=0;i<len;i++){
				classObj.classMethods.push(MethodParser.parse(methods[i],true));
			}
		}
		static private function parseInstanceElements(xml:XML,classObj:OMVClass):void{
			var i:int;
			var len:int;
			var properties:XMLList = xml.property;
			len = properties.length();
			for(i=0;i<len;i++){
				classObj.instanceProperties.push(PropertyParser.parse(properties[i],false));
			}
			var methods:XMLList = xml.method;
			len = methods.length();
			for(i=0;i<len;i++){
				classObj.instanceMethods.push(MethodParser.parse(methods[i],false));
			}
			
		}
	}
}