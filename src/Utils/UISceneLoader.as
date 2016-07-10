package Utils {
	import flash.events.Event;
	import flash.net.*;
	import flash.utils.ByteArray;
	import flash.display.Scene;
	
	import Objects.*;
	import flash.events.IEventDispatcher;
	import flash.events.EventDispatcher;
	
	//const storyXML = "assets/XML/template.xml";
	
	[Embed(source="../../assets/XML/template.xml", mimeType="application/octet-stream")]
	public class UISceneLoader extends ByteArray implements IEventDispatcher {
		
		//--- Statics ---//
		
		public static const OnXMLLoad = "UISceneLoader.OnXMLLoad";

		//--- Singleton ---//		
		public static var main = new UISceneLoader();
		
		public function UISceneLoader() {
			if (main != null) {
				throw new Error("UISceneLoader is a singleton. Use UISceneLoader.main");
			}else {
				loadXML();
				main = this;
			}
		}
		
		//--- XML ---//

		private var story: XML;
		private var xmlLoader: URLLoader = new URLLoader();
		
		public function loadXML() {
			var url:URLRequest = new URLRequest("assets/XML/template.xml");
			xmlLoader.load(url);
			xmlLoader.addEventListener(Event.COMPLETE, onXmlLoad);
		}
		
		function onXmlLoad(e: Event) {
			trace("xml loaded");
			story = new XML(xmlLoader.data);
			//trace(story.toXMLString())
			loadScene(new SceneID("test", 1, 1, 1, "scene01"));
			dispatchEvent(new Event(UISceneLoader.OnXMLLoad));
		}
		
		//--- Accessors ---//
		
		public function loadScene(sceneID: SceneID): UIScene {
			var mapXML = this.story.Body.maps.(@name==sceneID.maps);
			var sceneXML = mapXML.scene.(@X==sceneID.X && @Y==sceneID.Y && @Z==sceneID.Z && @serial==sceneID.serial);
			
			var mainOutputsXML = sceneXML.main_outputs;
			var mainOutputs = [];
			for (var i = 0; i < mainOutputsXML.output.length(); i++) {
				var outputXML = mainOutputsXML.output[i];
				var output = new MainOutput(outputXML.html.toString());
				mainOutputs.push(output);
			}
			
			var mainOutputsShowAll = mainOutputsXML.@show_all == "true" ? true : false;
			
			var buttonsXML = sceneXML.buttons;
			var buttons = [];
			for (var j = 0; j < buttonsXML.button.length(); j++) {
				var buttonXML = buttonsXML.button[j];
				var button:BButton = new BButton(buttonXML.label);
				
				var actionsXML = buttonXML.actions;
				var actions = [];
				for (var k = 0; k < actionsXML.action.length(); k++) {
					var actionXML = actionsXML.action[k];
					var action:BButtonAction = new BButtonAction();
					if (actionXML.@type == ActionType.NextScene_Short) {
						var sceneIDXML = actionXML.sceneID;
							var _sceneID: SceneID = new SceneID(sceneIDXML.@maps, sceneIDXML.@X, sceneIDXML.@Y, sceneIDXML.@Z, sceneIDXML.@serial);
							action.initAsNextScene(_sceneID);
					} else { }
					actions.push(action);
				}
				button.actions = actions;
				
				buttons.push(button);
			}
			
			return new UIScene(sceneID, mainOutputs, mainOutputsShowAll, buttons);
			
		}
		
		//--- Event Dispatch ---//
		
		private var _dispatcher = new EventDispatcher();
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void {
			_dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		public function dispatchEvent(event:Event):Boolean {
			return _dispatcher.dispatchEvent(event);
		}
		public function hasEventListener(type:String):Boolean {
			return _dispatcher.hasEventListener(type);
		}
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			_dispatcher.removeEventListener(type, listener, useCapture);
		}
		public function willTrigger(type:String):Boolean {
			return _dispatcher.willTrigger(type);
		}
	}
	
}
