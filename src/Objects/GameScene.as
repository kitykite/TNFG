package Objects {
	
	import Interfaces.*;
	
	public class GameScene implements IScene {

		//--- Vars ---//
		
		private var _sceneID: SceneID;
		private var _buttonNames = ["Default"];
		
		public function GameScene(sceneID: SceneID) {
			_sceneID = sceneID;
		}
		
		//--- IScene ---//
		
		// dealing with current scene
		public function get buttonNames(): Array { return _buttonNames; }
		public function get sceneID(): SceneID { return _sceneID; }

	}
	
}
