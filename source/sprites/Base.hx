package sprites;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
class Base extends FlxExtendedSprite
{
	public function new(position:FlxPoint)
	{
		super(position.x, position.y);
		loadGraphic("assets/images/base_human.png");
	}
}
