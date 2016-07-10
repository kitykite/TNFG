package Objects {
	
	public class BButtonAction {
		
		private var _actionType: String;
		public function get actionType() { return _actionType; }
		
		private var _sceneID: SceneID;
		public function get sceneID() { return _sceneID; }
		
		//--- inits ---//
		
		public function initAsNextScene(sceneID: SceneID) {
			_actionType = ActionType.NextScene;
			_sceneID = sceneID;
			
		}
		
		public function initAsChangeVar() {
			
		}
		
		public function initAsPopUp() {
			
		}

	}
	
}
