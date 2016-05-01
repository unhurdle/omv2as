package com.unhurdle
{
	public class OMVMethod
	{
		public function OMVMethod(method:XML)
		{
			structure = method;
		}
		public var static:Boolean;
		public var structure:XML;
		public var name:String;
		public var shortDescription:String;
		public var longDescription:String;
		public var parameters:Vector.<OMVParameter> = new Vector.<OMVParameter>();
		public var returnType:String = "void";
		

	}
}