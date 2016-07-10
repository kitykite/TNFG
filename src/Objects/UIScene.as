package Objects {
	
	import Interfaces.*;
	
	public class UIScene {

		//--- Vars ---//
		
		private var _sceneID: SceneID;
		private var _mainOutputs: Array;
		private var _mainOutputsShowAll: Boolean;
		private var _buttons: Array;
		
		public function UIScene(sceneID: SceneID, mainOutputs: Array, mainOutputsShowAll: Boolean, buttons: Array) {
			_sceneID = sceneID;
			_mainOutputs = mainOutputs;
			_mainOutputsShowAll = mainOutputsShowAll;
			_buttons = buttons;
			filterButtons();
			filterOutputs();
		}
		
		// dealing with current scene
		public function get buttons(): Array { return _buttons; }
		public function get sceneID(): SceneID { return _sceneID; }
		public function get mainOutputs(): Array { return _mainOutputs; }
		public function get mainOutputText(): String { return _mainOutputs[0].htmlText; };
		
		//--- Editing scene after loading ---//
		
		private function filterButtons() {
			
		}
		
		private function filterOutputs() {
			
		}

	}
	
}
