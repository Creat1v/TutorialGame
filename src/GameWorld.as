package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.FP
	import flash.geom.Point
	
	/**
	 * ...
	 * @author Creativ
	 */
	public class GameWorld extends World 
	{
		[Embed(source = "../lib/OgmoLevel.oel", mimeType = "application/octet-stream")] private static const DEFAULT_MAP:Class;
				
		private var square:Entity;
		public function GameWorld() 
		{
			trace("GameWorld constructor.");
		}
		
		override public function begin():void 
		{
			add(new Player(new Point));
			add(new Enemy);
			add(new Enemy);
			add(new Enemy);
			//add(new Level(DEFAULT_MAP));
			add(new Level());
			super.begin();
		}
	}
}