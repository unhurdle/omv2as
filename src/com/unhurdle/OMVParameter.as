package com.unhurdle
{
	public class OMVParameter
	{
		public function OMVParameter(xml:XML)
		{
			structure = xml;
		}
		public var structure:XML;
		public var name:String;
		public var optional:Boolean = false;
		public var description:String;
		public var type:String;
		public var value:String;
	}
}