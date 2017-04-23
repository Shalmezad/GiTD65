package sprites.units;
import flixel.math.FlxPoint;
class Imp extends Unit
{
	public function new(position:FlxPoint)
	{
		super(position);
		loadGraphic("assets/images/unit_imp.png");
	}
}

