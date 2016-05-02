package com.unhurdle.utils
{
	public class GeneralUtils
	{
		public function GeneralUtils()
		{
		}
		static public function isCore(val:String):Boolean{
			switch(val){
				case "File":
				case "Folder":
					return true;
				
			}
			return false;
		}
		static public function legalizeName(name:String):String{
			switch(name){
				case "break":
				case "case":
				case "catch":
				case "class":
				case "const":
				case "continue":
				case "debugger":
				case "default":
				case "delete":
				case "do":
				case "else":
				case "export":
				case "extends":
				case "finally":
				case "for":
				case "function":
				case "if":
				case "import":
				case "in":
				case "instanceof":
				case "new":
				case "of":
				case "return":
				case "super":
				case "switch":
				case "this":
				case "throw":
				case "try":
				case "typeof":
				case "var":
				case "void":
				case "while":
				case "with":
				case "yield":
				case "enum":
				case "implements":
				case "interface":
				case "let":
				case "package":
				case "private":
				case "protected":
				case "public":
				case "static":
				case "await":
				case "abstract":
				case "boolean":
				case "byte":
				case "char":
				case "double":
				case "final":
				case "float":
				case "goto":
				case "int":
				case "long":
				case "native":
				case "short":
				case "synchronized":
				case "throws":
				case "transient":
				case "volatile":
					name = "_" + name;
			}
			return name;
		}
	}
}