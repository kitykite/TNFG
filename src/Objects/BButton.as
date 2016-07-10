package Objects {
	
	public class BButton {
		
		//--- Vars ---//
		
		var _labels: String;
		public function get labels() { return _labels; }
		
		var _actions = [];
		public function get actions() { return _actions; }
		public function set actions(newValue: Array) { _actions = newValue; }

		public function BButton(labels: String) {
			_labels = labels;
		}
		

	}
	
}
