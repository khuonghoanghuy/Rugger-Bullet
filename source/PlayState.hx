package;

import flixel.FlxSprite;
import flixel.FlxState;

// this class will be the biggest file ever maybe
class PlayState extends FlxState
{
	var player:Player;

	var coolguyNPC:FlxSprite;

	public static var dialogueMode:Bool = false;

	override public function create()
	{
		super.create();
		dialogueMode = false;
		player = new Player(10, 10);
		add(player);
		coolguyNPC = new FlxSprite(); // get position from txt file
		DataUtil.patchPostion(coolguyNPC, Paths.txt("map1/coolguynpc"));
		coolguyNPC.loadGraphic(Paths.image("npc/coolguy"), true, 32, 32);
		coolguyNPC.animation.add("idle", [0, 1, 2], 8, true);
		coolguyNPC.animation.add("talk", [0]);
		add(coolguyNPC);
	}

	function createDialogue(text:String):Void
	{
		trace("Creating dialogue box with text " + text);
	}

	function removeDialogue():Void {}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
