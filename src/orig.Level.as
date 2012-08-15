package  
{
	import adobe.utils.CustomActions;
	import flash.utils.ByteArray;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.Graphic
	import net.flashpunk.masks.Grid;
	import net.flashpunk.Mask
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Creativ
	 */
	public class Level extends Entity 
	{
		private var _tiles:Tilemap;
		private var _grid:Grid;

		public function Level(xml:Class) 
		{
			_tiles = new Tilemap(Assets.SPRITE_TILESET, 640, 480, 40, 40);
			graphic = _tiles;
			layer = 1;
						
			_grid = new Grid(640, 480, 40, 40, 0, 0);
			mask = _grid;
			
			type = "level";
			
			loadLevel(xml);
		}

		private function loadLevel(xml:Class):void
		{
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			var xmlData:XML = new XML(dataString);
			
			var dataList:XMLList;
			var dataElement:XML;
			
			dataList = xmlData.Tiles.tile;
			for each(dataElement in dataList)
			{
				_tiles.setRect(int(dataElement.@x) /16, int(dataElement.@y) /16, 1, 1, int(dataElement.@tx));
				//line above this can look lokie this too _tiles.setTile(int(dataElement.@x) / 16, int(dataElement.@y) / 16, int(dataElement.@tx) / 16);
				_grid.setRect(int(dataElement.@x) /16 , int(dataElement.@y) /16, 1, 1, (int(dataElement.@tx) *16 == 0));
			}
		}		
	}
}