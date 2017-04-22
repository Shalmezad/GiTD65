package sprites.units;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.util.FlxColor;
class Unit extends FlxSprite
{
	public function new(position:FlxPoint)
	{
		super(position.x, position.y);
		this.makeGraphic(5,5, FlxColor.RED);
	}
}