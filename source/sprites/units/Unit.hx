package sprites.units;
import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.group.FlxGroup;
import flixel.math.FlxVelocity;
import flixel.util.FlxPath;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.util.FlxColor;
class Unit extends FlxExtendedSprite
{
	public var target:Unit = null;
	public var _attackHitBoxes:FlxGroup = null;

	public var _attackRadius:Int = 0;
	public var _attackSize:Int = 0;
	public var _attackDamage:Int = 0;
	public var _attackCooldown:Float = 0;

	private var cooldown:Float = 0;

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
		if(cooldown > 0)
		{
			cooldown -= elapsed;
		}
		if(target == null)
		{
			this.path.active = true;
		}
		else
		{
			this.path.active = false;
			// Go TOWARDS the enemy:
			FlxVelocity.moveTowardsPoint(this, target.center(), Std.int(100));

			if(cooldown <= 0 && FlxMath.distanceBetween(this, target) <= this._attackRadius)
			{
				FlxG.log.notice("Attacking");
				cooldown = _attackCooldown;
				// Add an attack
				if(this._attackHitBoxes != null)
				{
					FlxG.log.notice("Adding hitbox");
					var hitbox:Hitbox = new Hitbox(this.x, this.y, this._attackSize, this._attackSize);
					hitbox.health = this._attackDamage;
					this._attackHitBoxes.add(hitbox);
				}
			}

			if(!target.alive)
			{
				this.target = null;
			}
		}
	}
}