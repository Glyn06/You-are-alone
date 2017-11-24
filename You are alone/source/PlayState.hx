package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;

class PlayState extends FlxState
{
	private var bar2:J_Bar2;
	private var bar3:J_Bar3;
	private var marco:Marco;
	private var marco2:Marco;
	private var marco3:Marco;
	private var b:Button;
	private var b2:Button;
	
	override public function create():Void
	{
		super.create();
		
		bar2 = new J_Bar2(200, 200);
		bar3 = new J_Bar3(100, 100);
		marco = new Marco(0, 0);
		marco2 = new Marco(960, 0);
		marco3 = new Marco(1920, 0);
		b = new Button(FlxG.width -32,FlxG.height/2);
		b2 = new Button(FlxG.width * 2 - 32, FlxG.height / 2);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}