package sprites.units;
import flixel.math.FlxPoint;
class Knight extends Unit
{
	public function new(position:FlxPoint)
	{
		super(position);
		loadGraphic("assets/images/unit_knight.png");
	}
}
