package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author Joshua
 */
class WinState extends FlxState 
{
	private var youwin:FlxText;
	
	override public function create():Void 
	{
		super.create();
		
		youwin = new FlxText(FlxG.width / 2-64, FlxG.height / 2-32, 0, "YOU WIN", 32);
		add(youwin);
	}
}