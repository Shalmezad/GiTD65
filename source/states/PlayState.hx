package states;

import sprites.Hitbox;
import sprites.SightRadius;
import sprites.units.Imp;
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
	private var _myUnitSightRadius:FlxGroup;
	private var _myUnitAttackHitBoxes:FlxGroup;
	private var _enemyUnits:FlxGroup;

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
		_map.loadMapFromCSV("assets/data/new_map2.csv",
							"assets/images/nutter666_spritesheet_revised2.png",
							GameConstants.TILE_SIZE,
							GameConstants.TILE_SIZE,
							0,TileIndexes.DRAW_INDEX, TileIndexes.COLLISION_INDEX);
		add(_map);

		//Load the bases:
		var friendlyBasePositions:Array<FlxPoint>  = _map.getTileCoords(TileIndexes.FRIENDLY_BASE_INDEX,false);
		var enemyBasePositions:Array<FlxPoint> = _map.getTileCoords(TileIndexes.ENEMY_BASE_INDEX, false);
		_friendlyBasePosition = friendlyBasePositions[0];
		_enemyBasePosition = enemyBasePositions[0];
		// It's the bottom of the 9th, bases loaded

		_enemyBase = new Base(_enemyBasePosition);
		add(_enemyBase);
		_friendlyBase = new Base(_friendlyBasePosition);
		add(_friendlyBase);


		_myUnits = new FlxGroup();
		add(_myUnits);
		_myUnitSightRadius = new FlxGroup();
		add(_myUnitSightRadius);
		_myUnitAttackHitBoxes = new FlxGroup();
		add(_myUnitAttackHitBoxes);
		_enemyUnits = new FlxGroup();
		add(_enemyUnits);

		var enemy:Unit = new Imp(_enemyBase.center());
		var pathPoints:Array<FlxPoint> = _map.findPath(enemy.center(), _friendlyBase.center());
		enemy.path.start(pathPoints);
		_enemyUnits.add(enemy);

		_btnBuyTower = new FlxButton(20,440,"Tower",buyTowerCallback);
		_btnBuyUnit = new FlxButton(160,440,"Unit",buyUnitCallback);
		add(_btnBuyTower);
		add(_btnBuyUnit);

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		handleInput();
		FlxG.overlap(this._myUnitSightRadius, this._enemyUnits,enemySighted);
		FlxG.overlap(this._myUnitAttackHitBoxes, this._enemyUnits, hitEnemy);
	}

	private function enemySighted(s:SightRadius, u:Unit):Void
	{
		if(u.alive)
		{
			s.unit.target = u;
		}
	}

	private function hitEnemy(h:Hitbox, u:Unit):Void
	{
		u.hurt(h.health);
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
					addUnit(start);

				}
			}
		}
	}

	private function addUnit(point:FlxPoint):Void
	{
		var unit:Unit = new Knight(point);
		// Create a path:
		var pathPoints:Array<FlxPoint> = _map.findPath(point, _enemyBase.center());
		unit.path.start(pathPoints);
		add(unit);
		// Add a SightRadius for the unit:
		var sightRadius:SightRadius = new SightRadius();
		sightRadius.unit = unit;
		this._myUnitSightRadius.add(sightRadius);
		// Add the hitboxes to the unit so it can add attacks:
		unit._attackHitBoxes = this._myUnitAttackHitBoxes;
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
