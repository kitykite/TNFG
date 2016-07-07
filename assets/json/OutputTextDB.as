package assets.json {
	
	/* CLASS assets.json.OutputTextDB
		
		The class holding the parsed json object of OutputTextDB.json.
		This is a singleton class. No need to create multiple copies of the json object.
	
	*/	
		
	public class OutputTextDB {
		
		//MARK: - Class Instances
		
		public static var instance: OutputTextDB;

		//MARK: - Variables
		
		var _obj: Object;
		
		//MARK: - Getter/Setter
		
		public function get obj(): Object {
			return _obj;
		}
		
		//MARK: - Constructor
		
		public function OutputTextDB() {
			if (instance) {
				throw new Error("class OutputTextDB is already initiliazed, use getInstance() instead.");
			}
			instance = this;
			
			var jsonString = new String( new OutputTextDBFromJSON.Json );
			_obj = JSON.parse(jsonString);
		}
		
		public static function getInstance(): OutputTextDB {
			return instance;
		}
	}
	
}

import flash.utils.ByteArray;

class OutputTextDBFromJSON extends ByteArray {
	
	[Embed(source = "OutputTextDB.json", mimeType="application/octet-stream")]
	public static const Json:Class;
	
	public function OutputTextDBFromJSON() {
		
	}
}