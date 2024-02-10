package;

import flixel.FlxG;
import flixel.FlxSprite;

using StringTools;

class Player extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic(Paths.image("player_rpg"), true, 32, 32);
		added("up", [0, 1, 2, 1, 0]);
		added("up-walk", [3, 0, 4, 0]);
		added("down", [5, 6, 7, 6, 5]);
		added("down-walk", [8, 5, 9, 5]);
		added("left", [10, 11, 12, 11, 10]);
		added("left-walk", [13, 10, 14, 10]);
	}

	function added(name:String, array:Array<Int>)
	{
		return animation.add(name, array, 12, false);
	}

	override function update(elapsed:Float)
	{
		updateMove(elapsed);
		super.update(elapsed);
	}

	function updateMove(elapsed:Float):Void
	{
		var speed = 100 * elapsed;

		if (FlxG.keys.anyJustPressed([UP]))
		{
			playAnim("up-walk");
			velocity.y -= speed;
		}
		else if (FlxG.keys.anyJustPressed([DOWN]))
		{
			playAnim("down-walk");
			velocity.y += speed;
		}

		if (FlxG.keys.anyJustPressed([LEFT]))
		{
			playAnim("left-walk");
			flipX = false;
			velocity.x -= speed;
		}
		else if (FlxG.keys.anyJustPressed([RIGHT]))
		{
			playAnim("left-walk");
			flipX = true;
			velocity.x += speed;
		}

		// after moving, let stop them
		if (!FlxG.keys.anyJustPressed([LEFT]) || !FlxG.keys.anyJustPressed([RIGHT]) || !FlxG.keys.anyJustPressed([UP]) || !FlxG.keys.anyJustPressed([DOWN]))
		{
			velocity.set();
			if (Math.abs(velocity.x) < 0.1 && Math.abs(velocity.y) < 0.1)
				playAnim("down");
		}

		// Stop animations when not moving
		if ((velocity.x == 0 && velocity.y == 0))
		{
			// is a all animation without -walk
			if (!animation.curAnim.name.endsWith("-walk"))
				playAnim("down");
		}
	}

	function playAnim(name:String)
	{
		return animation.play(name);
	}
}
