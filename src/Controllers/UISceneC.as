package Controllers {
	
	import Interfaces.*;
	import Objects.*;
	import Utils.*;
	import flash.events.Event;
	
	public class UISceneC {
		
		//--- Classes ---//
		
		var game: Game;
		
		//--- Vars ---//
		protected var _scene: UIScene;
		public function get scene() { return _scene; }

		public function UISceneC(game: Game) {
			this.game = game;
		}
		
		public function newScene() {
			_scene = new UIScene(new SceneID("0", 1, 1, 0, "0"), new Array(new MainOutput("Loading…")), true, new Array(new BButton("loading")));
			UISceneLoader.main.addEventListener(UISceneLoader.OnXMLLoad, onXMLLoad);
			
			//_scene = new UIScene(new SceneID("0", 1, 1, 0, "0"), [], true, new Array(new BButton("default")));
			//UISceneLoader.main.loadXML();
		}
		
		function onXMLLoad(e: Event) {
			UISceneLoader.main.removeEventListener(UISceneLoader.OnXMLLoad, onXMLLoad);
			
			loadScene(new SceneID("init", 1, 1, 1, "scene01"));
		}
		
		// dealing with loading next scene
		public function updateScene(buttonClicked: int) {
			var button:BButton = _scene.buttons[buttonClicked - 1];
			for each (var action:BButtonAction in button.actions) {
				if (action.actionType == ActionType.NextScene) {
					loadScene(action.sceneID);
				}
			}
		}
		
		//--- Loading Scenes ---//
		
		private function loadScene(sceneID: SceneID) {
			_scene = UISceneLoader.main.loadScene(sceneID);
			game.updateScene();
		}
		

	}
	
}
