package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input
	import net.flashpunk.utils.Key
	import net.flashpunk.FP
	import flash.geom.Point
	
	/**
	 * ...
	 * @author Creativ
	 */
	
	public class Player extends Entity 
	{
		[Embed(source = "../assets/player.png")] private const PLAYER_GRAPHIC:Class;
		
		public var image:Image;
		private var _v:Point = new Point();
		
		public function Player(p:Point)
		{
			x = p.x = 100;
			y = p.y = 100;
			
			graphic = new Image(PLAYER_GRAPHIC);
			setHitbox(42, 21, 0, 0);
			type = "player";
		}
				
		override public function update():void 
		{
			updateMovement();
			updateCollision();
			super.update();
		}
		
		private function updateMovement():void
		{
			var movement:Point = new Point;
			if (Input.check(Key.LEFT))	{ movement.x--; }
			if (Input.check(Key.RIGHT))	{ movement.x++; }
			if (Input.check(Key.UP))	{ movement.y--; }
			if (Input.check(Key.DOWN))	{ movement.y++; }
			
			_v.x = 200 * FP.elapsed * movement.x;
			_v.y = 200 * FP.elapsed * movement.y;
		}

		private function updateCollision():void
		{
			x += _v.x;

			if (collide("enemy", x, y) )
				{
					Image(this.graphic).color = 0xff0000;
				}
			else
				{
					Image(this.graphic).color = 0xffffff;
				}
			
			if (collide("level", x, y))
			{
				trace("collide!");
				//handle collision here.
				if (FP.sign(_v.x) > 0)
				{
					//moving to the right
					_v.x = 0;
					x = Math.floor((x + width) / 40) * 40 - width;
				}
				else
				{
					//moving to the left.
					x = Math.floor(x / 40) * 40 + 40;
				}
			}
					
			y += _v.y;
			if (collide("level", x, y))
			{
				//Moving down
				if (FP.sign(_v.y) > 0)
				{
					_v.y = 0;
					y = Math.floor((y + height) / 40) * 40 - height;
				}
				else
				{ 	//Moving up
					_v.y = 0;
					y = Math.floor(y / 40) * 40 + 40;
				}
			}
		}
	}

}