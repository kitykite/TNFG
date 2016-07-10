package  {
	
	import Interfaces.*;
	import Controllers.*;
	import Objects.*;
	
	public class Game {
		
		//--- Classes ---//
		
		var ui: UI;
		
		var sceneC: UISceneC;
		
		public function Game(ui: UI) {
			this.ui = ui;
			sceneC = new UISceneC(this);
			newGame();
		}
		
		//--- Vars ---//
		
		private function get scene() { return sceneC.scene; }
		
		//--- Relays input ---//
		
		public function onBButtonClicked(buttonIndex: int) {
			sceneC.updateScene(buttonIndex);
			updateScene();
		}
		
		//--- Update UI ---//
		
		public function updateScene() {
			ui.updateScene(scene);
		}
		
		//--- New Game ---//
		
		private function newGame() {
			sceneC.newScene();
			updateScene();
		}

	}
	
}
