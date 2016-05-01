package com.unhurdle
{
	import flash.filesystem.File;

	public class MethodWriter
	{
		public function MethodWriter()
		{
		}
		static public function writeToBuffer(method:OMVMethod,buffer:Array):void{
			if(method.name == "[]"){
				return;
			}

			buffer.push("		");
			if(method.static){
				buffer.push("static ");
			}
			buffer.push("public function ");
			buffer.push(method.name);
			buffer.push("(");
			var i:int;
			var len:int = method.parameters.length;
			for(i=0;i<len;i++){
				ParameterWriter.writeToBuffer(method.parameters[i],buffer);
				if(i<len-1){
					buffer.push(", ");
				}
			}
			
			buffer.push(")");
			buffer.push(":");
			buffer.push(method.returnType);
			if(method.returnType == "void"){
				buffer.push("{}");
			} else {
				buffer.push("{return null;}");
			}
			buffer.push(File.lineEnding);
			
		}
	}
}