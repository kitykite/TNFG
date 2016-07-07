package assets.json {
	
	/* CLASS assets.json.OutputTextDB
		
		The class holding the parsed json object of OutputTextDB.json.
		This is a singleton class. No need to create multiple copies of the json object.
	
	*/	
		
	public class BButtonsDB {
		
		//MARK: - Class Instances
		
		public static var instance: BButtonsDB;

		//MARK: - Variables
		
		var _obj: Object;
		
		//MARK: - Getter/Setter
		
		public function get obj(): Object {
			return _obj;
		}
		
		//MARK: - Constructor
		
		public function BButtonsDB() {
			if (instance) {
				throw new Error("class OutputTextDB is already initiliazed, use getInstance() instead.");
			}
			instance = this;
			
			var jsonString = new String( new BButtonsDBFromJSON.Json );
			_obj = JSON.parse(jsonString);
		}
		
		public static function getInstance(): BButtonsDB {
			return instance;
		}
	}
	
}

import flash.utils.ByteArray;

class BButtonsDBFromJSON extends ByteArray {
	
	[Embed(source = "BButtonsDB.json", mimeType="application/octet-stream")]
	public static const Json:Class;
	
	public function BButtonsDBFromJSON() {
		
	}
}