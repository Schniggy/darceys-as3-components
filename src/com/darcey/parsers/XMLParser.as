package com.darcey.parsers
{
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	import com.darcey.debug.Ttrace;
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	
	
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	public class XMLParser
	{
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		
		
		
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		public function XMLParser(){}
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		
		
		
		public static function getElementById(xmlData:XML,parent:String,node:String,id:String,dataType:String = "string"):*
		{
			//var elementFound:int = xmlData.copy.node.(@id == id).length();
			//trace("xmlData[parent].length() = " + xmlData[parent].length() );
			//trace("xmlData[parent][node].length() = " + xmlData[parent][node].length() );
			//trace("xmlData[parent][node].(@id == id).length() = " + xmlData[parent][node].(@id == id).length() );
			//trace(xmlData[parent][node].(@id == id));
			
			var xmlValue:String = "";
			
			var validXMLPath:Boolean = false;
			if (xmlData[parent].length() > 0){
				if (xmlData[parent][node].length() > 0){
					validXMLPath = true;
				} else {
					trace("#### ERROR > XMLParser");
					trace("#### XMLParser > parent > node: XML Tag doesn't exist [xmlData." + parent + "." + node + "]");
					return;
				}
			} else {
				trace("#### ERROR > XMLParser");
				trace("#### XMLParser > parent: XML Tag doesn't exist [xmlData." + parent + "]");
				return;
			}
			
			
			var idFound:Boolean = false;
			if (validXMLPath){
				if (xmlData[parent][node].(@id == id).length() > 0){
					idFound = true;
					xmlValue = xmlData[parent][node].(@id == id);
				} else {
					trace("#### ERROR > XMLParser");
					trace("#### XMLParser > parent > node @id: ID not found [xmlData." + parent + "." + node + "@id=" + id + "]");
					return;
				}
			}
						
			
			
			
			
			// Resturn value data type casting
			switch (dataType.toLowerCase())
			{
				case "boolean":
					xmlValue = xmlValue.toLowerCase();
					if (xmlValue == "1" || xmlValue == "y" || xmlValue == "yes"){
						return true;
					} else {
						return false;
					}
					break;
				
				case "float":
					return parseFloat(xmlValue);
					break;
				
				case "int":
					return parseInt(xmlValue);
					break;
				
				case "number":
					return parseInt(xmlValue);
					break;
				
				case "uint":
					return uint(xmlValue);
					break;
				
				case "string":
					return String(xmlValue);
					break;
				
				case "xml":
					return xmlValue;
					break;
								
				default:
					trace("#### ERROR > XMLParser");
					trace("#### Unhandled return data type of [" + dataType + "]");
					trace("#### Options available are: string, boolean, float(number), int, uint");
					return null;
					break;
			}
			
		}
		
		
		
		
		
		
		public static function getAttributeById(xmlData:XML,parent:String,node:String,id:String,attribute:String):String
		{
			//trace("xmlData[parent][node].length() = " + xmlData[parent][node].length() );
			//trace("xmlData[parent][node].(@id == id).length() = " + xmlData[parent][node].(@id == id).length() );
			//trace("xmlData[parent][node].(@id == id) = " + xmlData[parent][node].(@id == id));
			//trace("xmlData[parent][node].(@id == id) = " + xmlData[parent][node].(@id == id).@[attribute]);
			
			var xmlValue:String = "";
			
			var validXMLPath:Boolean = false;
			if (xmlData[parent].length() > 0){
				if (xmlData[parent][node].length() > 0){
					validXMLPath = true;
				} else {
					trace("#### ERROR > XMLParser");
					trace("#### XMLParser > parent > node: XML Tag doesn't exist [xmlData." + parent + "." + node + "]");
					return null;
				}
			} else {
				trace("#### ERROR > XMLParser");
				trace("#### XMLParser > parent: XML Tag doesn't exist [xmlData." + parent + "]");
				return null;
			}
			
			
			if (validXMLPath){
				if (xmlData[parent][node].(@id == id).length() > 0){
					if (xmlData[parent][node].(@id == id).@[attribute].length() > 0){
						xmlValue = xmlData[parent][node].(@id == id).@[attribute];
					} else {
						trace("#### ERROR > XMLParser");
						trace("#### XMLParser > parent > node @id=="+id+": Attribute not found [xmlData." + parent + "." + node + "@id=" + id + "].@[" + attribute + "]");
						return null;
					}
				} else {
					trace("#### ERROR > XMLParser");
					trace("#### XMLParser > parent > node @id: ID not found [xmlData." + parent + "." + node + "@id=" + id + "]");
					return null;
				}
			}
			
			
			
			
			
			return String(xmlValue);
			
		}
		
		
		
		
		
		
		
		/*
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		public static function getCopyById(id:String):String
		{
			var elementFound:int = xmlData.copy.node.(@id == id).length();
			if (elementFound == 0){
				trace("#######################################################################################################");
				trace("XMLModel.getCopyById(id): ID of [" + id + "] doesn't exist, please check your XML");
				trace("#######################################################################################################");
				return "XMLModel.getCopyById(id): ID of [" + id + "] doesn't exist, please check your XML";
			} else {
				return XML(xmlData.config.node.(@id == id)).toString();
			}
		}
		// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
		*/
	}
	// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
}