package sprites;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import sprites.units.Unit;

class SightRadius extends FlxExtendedSprite
{
	public var unit:Unit;
	//0xAARRGGBB
	private static var COLOR:Int = 0x55FF0000;
	public function new()
	{
		super();
		makeGraphic(50,50, FlxColor.fromInt(COLOR));
		this.centerOrigin();
		this.centerOffsets();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		this.setCenter(unit.center());
	}


}
