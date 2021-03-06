package sprites;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
class FlxExtendedSprite extends FlxSprite
{
	public function centerX():Float
	{
		return x + width/2;
	}

	public function centerY():Float
	{
		return y + height/2;
	}

	public function center():FlxPoint
	{
		return new FlxPoint(centerX(), centerY());
	}

	public function setCenter(center:FlxPoint)
	{
		this.x = center.x - width / 2;
		this.y = center.y - height / 2;
	}
}
