package com.unhurdle
{
	import com.unhurdle.utils.FileUtils;
	
	import flash.filesystem.File;

	public class ClassWriter
	{
		private var _folder:File;
		private var _packagePath:String;
		public function ClassWriter(folder:File,packagePath:String)
		{
			_folder = folder;
			_packagePath = packagePath;
		}
		public function writeClass(classObj:OMVClass):void{
			var superClass:OMVClass;
			_buffer.length = 0;
			addHeader();
			//class header
			_buffer.push("	public class ");
			_buffer.push(classObj.name);
			if(classObj.superclass){
				superClass = OMVReader.getClass(classObj.superclass);
				if(superClass && superClass.enum){
					superClass = null;
				}
				if(superClass){
					_buffer.push(" extends ");
					_buffer.push(classObj.superclass);
				}
			}
			_buffer.push(File.lineEnding);
			_buffer.push("	{");
			_buffer.push(File.lineEnding);
			
			//constructor (if necessary)
			addConstructor(classObj);
			var i:int;
			var len:int;
			
			if(classObj.enum){
				addEnumMethods(classObj);
				len = classObj.classProperties.length;
				for(i=0;i<len;i++){
					var prop:OMVProperty = classObj.classProperties[i];
					_buffer.push("		");
						_buffer.push("static public const ");
					_buffer.push(prop.name);
					_buffer.push(":");
					_buffer.push(classObj.name);
					_buffer.push(" = new ");
					_buffer.push(classObj.name);
					_buffer.push("(");
					_buffer.push(prop.value);
					_buffer.push(");");
					_buffer.push(File.lineEnding);

				}

			} else {
				
				//static methods
				len = classObj.classMethods.length;
				for(i=0;i<len;i++){
					if(superClass && superClass.hasMethod(classObj.classMethods[i].name)){
						continue;
					}
					MethodWriter.writeToBuffer(classObj.classMethods[i],_buffer);
				}
				//static properties
				len = classObj.classProperties.length;
				for(i=0;i<len;i++){
					if(superClass && superClass.hasProperty(classObj.classProperties[i].name)){
						continue;
					}
					PropertyWriter.writeToBuffer(classObj.classProperties[i],_buffer);
				}
				//instance methods
				len = classObj.instanceMethods.length;
				for(i=0;i<len;i++){
					if(superClass && superClass.hasMethod(classObj.instanceMethods[i].name)){
						continue;
					}
					MethodWriter.writeToBuffer(classObj.instanceMethods[i],_buffer);
				}
				
				//instance properties
				len = classObj.instanceProperties.length;
				for(i=0;i<len;i++){
					if(superClass && superClass.hasProperty(classObj.instanceProperties[i].name)){
						continue;
					}
					PropertyWriter.writeToBuffer(classObj.instanceProperties[i],_buffer);
				}
			}
			
			//class footer
			_buffer.push("	}");
			_buffer.push(File.lineEnding);
			
			addFooter();
			var file:File = _folder.resolvePath(classObj.name + ".as");
			FileUtils.writeUTFFile(file.url,_buffer.join(""));
		}
		private function addConstructor(classObj:OMVClass):void{
			if(classObj.constructorParams.length){
				if(classObj.constructorShortDescription || classObj.constructorLongDescription){
					_buffer.push("		/**");
					_buffer.push(File.lineEnding);
					_buffer.push("		* ");
					if(classObj.constructorShortDescription){
						_buffer.push(classObj.constructorShortDescription);
						_buffer.push(" ");
					}
					_buffer.push(classObj.constructorLongDescription);
					_buffer.push(File.lineEnding);
					
					_buffer.push("		*/");
					_buffer.push(File.lineEnding);
				}
				_buffer.push("		public function ");
				_buffer.push(classObj.name);
				_buffer.push("(");
				insertParam(classObj.constructorParams[0] as OMVParameter);
				var i:int;
				for(i=1;i<classObj.constructorParams.length;i++){
					_buffer.push(", ");
					insertParam(classObj.constructorParams[i] as OMVParameter);
				}
				_buffer.push("){}");
				_buffer.push(File.lineEnding);
			}
			
		}
		private function insertParam(param:OMVParameter):void{
			_buffer.push(param.name);
			_buffer.push(":");
			_buffer.push(param.type);
			if(param.optional){
				switch(param.type){
					case "Number":
					case "int":
					case "uint":
						_buffer.push(" = 0");
						break;
					default:
						_buffer.push(" = null");
						break;
				}
			}
			
		}
		private function addHeader():void{
			_buffer.push("package ");
			_buffer.push(_packagePath);
			_buffer.push(File.lineEnding);
			_buffer.push("{");
		}
		private function addFooter():void{
			_buffer.push("}");

		}
		private function addEnumMethods(classObj:OMVClass):void{
			_buffer.push("		public function ");
			_buffer.push(classObj.name);
			_buffer.push("(value:*){}");
			_buffer.push(File.lineEnding);

		}
		private var _buffer:Array = [];
	}
}