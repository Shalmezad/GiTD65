package sprites;
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
}
