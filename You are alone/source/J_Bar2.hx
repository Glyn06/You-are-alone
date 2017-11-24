package;

import flixel.FlxG;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;

/**
 * ...
 * @author Glyn & Alexander
 */
class J_Bar2 extends J_Bar 
{
	
	public function new(x:Float=0, y:Float=0, ?direction:FlxBarFillDirection, width:Int=100, height:Int=50, ?parentRef:Dynamic, variable:String="", min:Float=0, max:Float=100, showBorder:Bool=false) 
	{
		maxTime = 5;
		super(x, y, direction, width, height, parentRef, variable, 0, maxTime, showBorder);
		
		setParent(this, "time");
		set_fillDirection(RIGHT_TO_LEFT);
		text = new FlxText(x+width / 2,y+height / 2, 0, "Dude", 8, false);
		createFilledBar(0xffff0000, 0xff000000, true, 0xffffffff);
		
		addToTheWorld();
	}
	
	override public function action():Void 
	{
		super.action();
		
		trace("HEY DUDE!");
		
	}
}