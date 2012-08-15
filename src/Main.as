package 
{
	import net.flashpunk.Engine
	import net.flashpunk.FP
	import net.flashpunk.utils.Key
	
	/**
	 * ...
	 * @author Creativ
	 */
	public class Main extends Engine
	{
		
		public function Main():void 
		{
			super(640, 480, 60, false);
			FP.console.enable();
			FP.console.toggleKey = Key.ENTER;
		}
		
		override public function init():void 
		{
			trace("FlashPunk has initialized");
			FP.world = new GameWorld();
			super.init();
		}
		
	}
	
}