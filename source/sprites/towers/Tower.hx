package sprites.towers;
import flixel.FlxSprite;

class Tower extends FlxSprite
{
	public function new()
	{
		this.makeGraphic(GameConstants.TILE_SIZE,GameConstants.TILE_SIZE);
	}
}
