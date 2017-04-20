package states;

import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{

	private var _map:FlxTilemap;

	override public function create():Void
	{
		super.create();
		_map = new FlxTilemap();
		_map.loadMapFromCSV("assets/data/map.csv",
							"assets/images/world_tileset.png",
							GameConstants.TILE_SIZE,
							GameConstants.TILE_SIZE,
							0,1);
		add(_map);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
