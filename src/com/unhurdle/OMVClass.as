package com.unhurdle
{
	public class OMVClass
	{
		public function OMVClass(classXML:XML)
		{
			structure = classXML;
		}
		public var structure:XML;
		
		public var name:String;
		public var superclass:String;
		public var enum:Boolean = false;
		public var dynamic:Boolean = false;
		public var shortDescription:String;
		public var longDescription:String;
		public var classProperties:Vector.<OMVProperty> = new Vector.<OMVProperty>();
		public var classMethods:Vector.<OMVMethod> = new Vector.<OMVMethod>();
		public var instanceProperties:Vector.<OMVProperty> = new Vector.<OMVProperty>();
		public var instanceMethods:Vector.<OMVMethod> = new Vector.<OMVMethod>();
		
		public var constructorShortDescription:String;
		public var constructorLongDescription:String;
		public var constructorParams:Vector.<OMVParameter> = new Vector.<OMVParameter>();
		
		public function hasProperty(propName:String):Boolean{
			var i:int;
			var len:int = classProperties.length;
			for(i=0;i<len;i++){
				if(classProperties[i].name == propName){
					return true;
				}
			}
			len = instanceProperties.length;
			for(i=0;i<len;i++){
				if(instanceProperties[i].name == propName){
					return true;
				}
			}
			return false;
		}
		public function hasMethod(methodName:String):Boolean{
			var i:int;
			var len:int = classMethods.length;
			for(i=0;i<len;i++){
				if(classMethods[i].name == methodName){
					return true;
				}
			}
			len = instanceMethods.length;
			for(i=0;i<len;i++){
				if(instanceMethods[i].name == methodName){
					return true;
				}
			}
			return false;
		}
		public function requiresCore():Boolean{
			var i:int;
			var len:int = constructorParams.length;
			for(i=0;i<len;i++){
				if(constructorParams[i].requiresCore()){
					return true;
				}
			}
			len = classProperties.length;
			for(i=0;i<len;i++){
				if(classProperties[i].requiresCore()){
					return true;
				}
			}
			len = classMethods.length;
			for(i=0;i<len;i++){
				if(classMethods[i].requiresCore()){
					return true;
				}
			}
			len = instanceProperties.length;
			for(i=0;i<len;i++){
				if(instanceProperties[i].requiresCore()){
					return true;
				}
			}
			len = instanceMethods.length;
			for(i=0;i<len;i++){
				if(instanceMethods[i].requiresCore()){
					return true;
				}
			}
			return false;
		}
		
	}
}