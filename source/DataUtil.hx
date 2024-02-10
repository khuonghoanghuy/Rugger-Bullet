package;

import flixel.FlxSprite;
import lime.utils.Assets;

using StringTools;

class DataUtil
{
	public static function inTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');

		for (i in 0...daList.length)
		{
			daList[i] = daList[i].trim();
		}

		return daList;
	}

	inline public static function patchPostion(whatSprite:FlxSprite, filerePatchOffset:String)
	{
		var daFile:Array<String> = inTextFile(filerePatchOffset);
		for (i in daFile)
		{
			var words:Array<String> = i.split(" ");
			whatSprite.setPosition(Std.parseFloat(words[0]), Std.parseFloat(words[1]));
		}
	}
}
