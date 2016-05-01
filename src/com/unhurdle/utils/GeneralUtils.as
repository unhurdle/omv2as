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
	}
}