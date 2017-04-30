package sprites;
import flixel.util.FlxColor;
import flixel.FlxSprite;

/**
* Has:
*   x, y, w, h
*   health = damage it does
**/
class Hitbox extends FlxSprite
{
	public var timeToLive:Float = 0.25;
	//0xAARRGGBB
	private static var COLOR:Int = 0xFF00FF00;
	public function new(x:Float, y:Float, w:Int, h:Int)
	{
		// Doing -w/2 and -h/2 to center on x/y
		super(x-w/2,y-h/2);
		makeGraphic(w,h,FlxColor.fromInt(COLOR));
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timeToLive -= elapsed;
		if(timeToLive <= 0)
		{
			kill();
		}
	}
}
