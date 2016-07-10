package Utils {
	
	public class VarsManager {
		
		public static var main = VarsManager();

		public function VarsManager() {
			if (main != null) {
				throw new Error("VarsManager is a singleton. Use VarsManager.main");
			}else {
				main = this;
			}
		}

	}
	
}
