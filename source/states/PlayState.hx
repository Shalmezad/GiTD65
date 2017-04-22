package states;

import sprites.units.Knight;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _myUnits:FlxGroup;

	private var _btnBuyTower:FlxButton;
	private var _btnBuyUnit:FlxButton;
	private var _map:FlxTilemap;

	// True if the user is currently trying to buy a tower
	private var _buyingTower:Bool = false;
	// True if the user is currently trying to buy a unit
	private var _buyingUnit:Bool = false;

	override public function create():Void
	{
		super.create();
		_map = new FlxTilemap();
		var drawIndex:Int = 0;
		var collideIndex:Int = 2;
		_map.loadMapFromCSV("assets/data/map.csv",
							"assets/images/world_tileset.png",
							GameConstants.TILE_SIZE,
							GameConstants.TILE_SIZE,
							0,drawIndex, collideIndex);
		add(_map);

		_myUnits = new FlxGroup();
		add(_myUnits);

		_btnBuyTower = new FlxButton(20,440,"Tower",buyTowerCallback);
		_btnBuyUnit = new FlxButton(160,440,"Unit",buyUnitCallback);
		add(_btnBuyTower);
		add(_btnBuyUnit);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		handleInput();
	}

	private function handleInput():Void
	{
		if(FlxG.mouse.justReleased)
		{
			if(_buyingUnit)
			{
				// Figure out if they clicked a valid spot:
				if(!_map.overlapsPoint(FlxG.mouse.getWorldPosition(FlxG.camera)) && FlxG.mouse.y < 400)
				{
					_myUnits.add(new Knight(FlxG.mouse.getPosition()));
				}
			}
		}
	}


	private function buyTowerCallback():Void
	{
		_buyingTower = true;
	}

	private function buyUnitCallback():Void
	{
		_buyingUnit = true;
	}

}
