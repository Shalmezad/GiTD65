package sprites.units;
import flixel.util.FlxPath;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.util.FlxColor;
class Unit extends FlxSprite
{

	public function new(position:FlxPoint)
	{
		super(position.x, position.y);
		path = new FlxPath();
		this.maxVelocity = new FlxPoint(20,20);
		this.makeGraphic(5,5, FlxColor.RED);
	}
}