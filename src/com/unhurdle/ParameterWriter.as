package com.unhurdle
{
	public class ParameterWriter
	{
		public function ParameterWriter()
		{
		}
		static public function writeToBuffer(param:OMVParameter,buffer:Array):void{
			buffer.push(param.name);
			buffer.push(":");
			buffer.push(param.type);
			if(param.optional){
				if(param.type == "Boolean"){
					buffer.push("=false");
				} else if(param.type == "int" || param.type == "Number"){
					buffer.push("=0");
				} else {
					buffer.push("=null");
				}
				//TODO: add better default values based on type
				
			}

		}

	}
}