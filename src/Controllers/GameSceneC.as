package Controllers {
	
	import Interfaces.*;
	import Objects.*;
	
	public class GameSceneC {
		
		//--- Vars ---//
		protected var _scene: IScene;
		public function get scene() { return _scene; }

		public function GameSceneC() {
			// constructor code
		}
		
		public function newScene() {
			_scene = new GameScene(new SceneID("0", 1, 1, 0, "0"));
		}
		
		// dealing with loading next scene
		public function updateScene(buttonClicked: int) {
			
		}
		
		//--- Loading Scenes ---//
		
		private function loadScene(sceneID: SceneID) {
			
		}
	}
	
}
