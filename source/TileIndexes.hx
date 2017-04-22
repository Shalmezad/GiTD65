package ;
class TileIndexes
{

	/*
	0-7: Walkable tiles

	8: Denotes friendly base
	9: Denotes enemy base
	10: Denotes friendly tower
	11: Denotes enemy tower

	12-23: Unwalkable tile
	 */

	public static var DRAW_INDEX:Int = 0;
	public static var COLLISION_INDEX:Int = 8;
	public static var FRIENDLY_BASE_INDEX:Int = 8;
	public static var ENEMY_BASE_INDEX:Int = 9;
}
