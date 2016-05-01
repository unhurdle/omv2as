package com.unhurdle
{
	import com.unhurdle.utils.GeneralUtils;

	public class OMVProperty
	{
		public function OMVProperty(property:XML)
		{
			structure = property;
		}
		public var structure:XML;
		public var static:Boolean;
		public var name:String;
		public var enum:Boolean = false;
		public var type:String;
		public var value:String = "";
		public var shortDescription:String;
		public var longDescription:String;
		
		public var readOnly:Boolean = false;
		
		public function requiresCore():Boolean{
			return GeneralUtils.isCore(type);
		}

	}
}