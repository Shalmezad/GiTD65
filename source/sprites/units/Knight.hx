package sprites.units;
import flixel.math.FlxPoint;
class Knight extends Unit
{

	public function new(position:FlxPoint)
	{
		super(position);
		loadGraphic("assets/images/unit_knight.png");
		this.centerOrigin();

		_attackRadius = 20;
		_attackSize = 5;
		_attackDamage = 2;
		_attackCooldown = 0.5;
	}
}
