package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP
	
	/**
	 * ...
	 * @author Creativ
	 */
	public class Enemy extends Entity 
	{
		[Embed(source = "../assets/Enemy.png")] public const ENEMY_GRAPHIC:Class;
		
		public function Enemy() 
		{
			graphic = new Image(ENEMY_GRAPHIC);
			x = FP.rand(FP.screen.width);
			y = FP.rand(FP.screen.height);
			type = "enemy"
			setHitbox(30, 30, 0, 0);
		}
		
	}

}