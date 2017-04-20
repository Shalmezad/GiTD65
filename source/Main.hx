package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;
import states.PlayState;

class Main extends Sprite
{
	public function new()
	{
		super();
		var updateFrameRate:Int = 30;
		var drawFrameRate:Int = 30;
		var skipSplash:Bool = true;
		var fullScreen:Bool = false;
		addChild(new FlxGame(0, 0, PlayState, 1, updateFrameRate, drawFrameRate, skipSplash, fullScreen));
	}
}
