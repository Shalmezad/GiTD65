package states;

import flixel.util.FlxPath;
import sprites.units.Unit;
import sprites.Base;
import flixel.math.FlxPoint;
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
	private var _friendlyBasePosition:FlxPoint;
	private var _enemyBasePosition:FlxPoint;

	private var _myUnits:FlxGroup;

	private var _btnBuyTower:FlxButton;
	private var _btnBuyUnit:FlxButton;
	private var _map:FlxTilemap;

	private var _friendlyBase:Base;
	private var _enemyBase:Base;

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
		_map.loadMapFromCSV("assets/data/new_map.csv",
							"assets/images/world_tileset.png",
							GameConstants.TILE_SIZE,
							GameConstants.TILE_SIZE,
							0,TileIndexes.DRAW_INDEX, TileIndexes.COLLISION_INDEX);
		add(_map);

		//Load the bases:
		var friendlyBasePositions:Array<FlxPoint>  = _map.getTileCoords(TileIndexes.FRIENDLY_BASE_INDEX,false);
		var enemyBasePositions:Array<FlxPoint> = _map.getTileCoords(TileIndexes.ENEMY_BASE_INDEX, false);
		_friendlyBasePosition = friendlyBasePositions[0];
		_enemyBasePosition = enemyBasePositions[0];
		// It's the bottom of the 9th, bases loaded,
		_enemyBase = new Base(_enemyBasePosition);
		add(_enemyBase);


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
					var start:FlxPoint = FlxG.mouse.getPosition();
					var unit:Unit = new Knight(start);
					// Create a path:
					var pathPoints:Array<FlxPoint> = _map.findPath(start, _enemyBase.center());
					unit.path.start(pathPoints);
					add(unit);
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
