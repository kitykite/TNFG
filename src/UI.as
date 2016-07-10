package  {
	
	import flash.display.*;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	import Interfaces.*;
	import Objects.*;
	import Utils.*;
	
	
	public class UI extends MovieClip {
		
		//--- Vars ---//
		
		//private var currentShowableBButtons = [];
		private var currentBButtonPage = 1;
		private function get buttons() { return scene.buttons; }
		
		//--- Class Instances ---//
		
		private var game: Game;
		private var scene: UIScene;
		
		public function UI() {
			//set up stage
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			
			// set up classes
			UISceneLoader.main.loadXML();
			
			this.game = new Game(this);
			
			// event listeners
			addEventListeners(Buttons.bB, MouseEvent.CLICK, onBButtonClicked);
			addEventListeners(Buttons.pB, MouseEvent.CLICK, onPButtonClicked);
			//addEventListeners(UI.buttons.nB, MouseEvent.CLICK, onNButtonClicked);
			//addEventListeners(UI.buttons.xB, MouseEvent.CLICK, onXButtonClicked);
			
		}
		
		//--- Event Listeners ---//
		
		private function addEventListeners(forButton: Array, forEvent: String, listener: Function) {
			for each (var buttonName in forButton) {
				this[buttonName].addEventListener(forEvent, listener);
			}
		}
		
		private function onBButtonClicked(e: Event) {
			game.onBButtonClicked(parseInt(e.currentTarget.name.substr(1,1)) + (currentBButtonPage - 1) * 6);
		}
		
		private function onPButtonClicked(e: Event) {
			if (e.currentTarget.name == Buttons.pB[0]) { //BP
				currentBButtonPage -= 1;
			} else if (e.currentTarget.name == Buttons.pB[1]) { //BN
				currentBButtonPage += 1;
			}
			layoutBButtons();
		}
		
		//--- Output ---//
		
		public function updateScene(newScene: UIScene) {
			this.scene = newScene;
			layoutBButtons();
			layoutMainOutput();
		}
		
		//--- TextField ---//
		
		private function layoutMainOutput() {
			this.outputWindow.scrollBar.scrollTarget = this.outputWindow.outputWindow;
			this.outputWindow.outputWindow.htmlText = scene.mainOutputText;
		}
		
		//--- bButtons ---//
		
		private function layoutBButtons() {
			hideButtons(Buttons.bB);
			hideButtons(Buttons.pB);
			var totalPage = Math.ceil(buttons.length / 6);
			var currentBButtonCount: int;
			if (currentBButtonPage == totalPage && buttons.length % 6 != 0) {
				currentBButtonCount = buttons.length % 6;
			} else {
				currentBButtonCount = 6;
			}
			for (var i = 0; i < currentBButtonCount; i++) {
				setBButtonLabel(Buttons.bB[i], buttons[i + (6 * (currentBButtonPage - 1))].labels);
				showBButton(currentBButtonCount);
			}
			if (currentBButtonPage < totalPage) {
				showPButtons("N");
			}
			if (currentBButtonPage > 1) {
				showPButtons("P");
			}
		}
		
		private function hideButtons(group: Array) {
			for each (var button in group) {
				this[button].visible = false;
			}
		}
		
		private function showBButton(count: int) {
			for (var i = 0; i < count; i++) {
				this[Buttons.bB[i]].visible = true;
			}
		}
		
		private function setBButtonLabel(button:String, text: String) {
			this[button].getChildByName(button+"T").text = text;
		}
		
		//--- pButtons ---//
		
		private function showPButtons(selector: String) {
			if (selector == "P") {
				this[Buttons.pB[0]].visible = true;
			} else if (selector == "N") {
				this[Buttons.pB[1]].visible = true;
			}
		}
	}
	
}
