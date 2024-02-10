package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var player:Player;

	override public function create()
	{
		super.create();
		player = new Player(10, 10);
		add(player);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
