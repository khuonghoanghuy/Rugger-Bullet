package;

import flixel.FlxG;
import flixel.FlxSprite;

using StringTools;

class Player extends FlxSprite
{
	static inline var SPEED:Float = 100;

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
		antialiasing = false;
	}

	function added(name:String, array:Array<Int>)
	{
		return animation.add(name, array, 12, false);
	}

	override function update(elapsed:Float)
	{
		updateMove();
		super.update(elapsed);
	}

	function updateMove():Void
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;

		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		right = FlxG.keys.anyPressed([RIGHT, D]);

		if (up && down)
			up = down = false;
		if (left && right)
			left = right = false;

		if (!PlayState.dialogueMode)
		{
			if (up || down || left || right)
			{
				var newAngle:Float = 0;
				if (up)
				{
					newAngle = -90;
					if (left)
						newAngle -= 45;
					else if (right)
						newAngle += 45;
					facing = UP;
				}
				else if (down)
				{
					newAngle = 90;
					if (left)
						newAngle += 45;
					else if (right)
						newAngle -= 45;
					facing = DOWN;
				}
				else if (left)
				{
					newAngle = 180;
					facing = LEFT;
				}
				else if (right)
				{
					newAngle = 0;
					facing = RIGHT;
				}

				velocity.x = SPEED;
				velocity.y = SPEED;
				velocity.setPolarDegrees(SPEED, newAngle);

				switch (facing)
				{
					case LEFT:
						flipX = false;
						animation.play("left-walk");
					case RIGHT:
						flipX = true;
						animation.play("left-walk");
					case UP:
						flipX = false;
						animation.play("up-walk");
					case DOWN:
						flipX = false;
						animation.play("down-walk");
					case _:
				}
			}
			else
			{
				velocity.x = 0;
				velocity.y = 0;
				switch (facing)
				{
					case LEFT:
						flipX = false;
						animation.play("left");
					case RIGHT:
						flipX = true;
						animation.play("left");
					case UP:
						flipX = false;
						animation.play("up");
					case DOWN:
						flipX = false;
						animation.play("down");
					case _:
				}
			}
		}
	}
}
