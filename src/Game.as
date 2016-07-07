package  {
	
	import Interfaces.*;
	import Controllers.*;
	import Objects.*;
	
	public class Game {
		
		//--- Classes ---//
		
		var ui: UI;
		
		var sceneC: GameSceneC;
		
		public function Game(ui: UI) {
			this.ui = ui;
			sceneC = new GameSceneC();
			newGame();
		}
		
		//--- Vars ---//
		
		private function get scene() { return sceneC.scene; }
		
		//--- Relays input ---//
		
		public function onBButtonClicked(buttonIndex: int) {
			sceneC.updateScene(buttonIndex);
			ui.updateScene(scene);
		}
		
		//--- New Game ---//
		
		private function newGame() {
			sceneC.newScene();
			ui.updateScene(scene);
		}

	}
	
}
