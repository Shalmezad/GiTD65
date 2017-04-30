package sprites.units;
import flixel.math.FlxVelocity;
import flixel.util.FlxPath;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.util.FlxColor;
class Unit extends FlxExtendedSprite
{
	public var target:Unit = null;

	public function new(position:FlxPoint)
	{
		super(position.x, position.y);
		path = new FlxPath();
		this.maxVelocity = new FlxPoint(20,20);
		this.makeGraphic(5,5, FlxColor.RED);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(target == null)
		{
			this.path.active = true;
		}
		else
		{
			this.path.active = false;
			// Go TOWARDS the enemy:
			FlxVelocity.moveTowardsPoint(this, target.center(), Std.int(100));
			if(!target.alive)
			{
				this.target = null;
			}
		}
	}
}