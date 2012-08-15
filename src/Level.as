package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Grid;
	import flash.geom.Point;

	public class Level extends Entity 
	{
		[Embed(source = '../assets/block.png')]private const TILESET:Class;
		[Embed(source = '../lib/OgmoLevel.oel', mimeType = 'application/octet-stream')]private const GBmap:Class;
		
		private var _tilemap:Tilemap;
		private var _grid:Grid;
		
		public function Level():void
		{
			//graphic = _tilemap = new Tilemap(TILESET, FP.screen.width, FP.screen.height, 40, 40);
			//mask = _grid = new Grid(FP.screen.width, FP.screen.height, 40, 40, 0, 0);		
			graphic = _tilemap = new Tilemap(TILESET, 640, 480, 40, 40);
			mask = _grid = new Grid(640, 480, 40, 40, 0, 0);		
			type = "level";		
			layer = 1
			loadlevel(GBmap);
		}
		
		public function loadlevel(map:Class):void
		{
			var xmL:XML = FP.getXML(map);
			var o:XML;
			
			for each(o in xmL.Tiles.tile)
			{
				_tilemap.setTile(o.@x, o.@y, o.@id);
			}
			for each(o in xmL.Wall.tile)
			{
				_grid.setRect(o.@x, o.@y, 1,1, true);
				_tilemap.setTile(o.@x, o.@y, o.@id);
			}
		}
	}
	
}