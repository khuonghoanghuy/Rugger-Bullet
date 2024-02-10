package;

class Paths
{
	inline public static function image(paths:String):String
	{
		return 'assets/images/' + paths + ".png";
	}

	inline public static function txt(paths:String):String
	{
		return 'assets/data/' + paths + ".txt";
	}

	inline public static function music(paths:String):String
	{
		return 'assets/music/' + paths;
	}

	inline public static function sounds(paths:String):String
	{
		return 'assets/sounds/' + paths;
	}
}
