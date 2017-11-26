package;

import flixel.FlxG;
import flixel.effects.FlxFlicker;
import flixel.effects.particles.FlxEmitter;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;
import flixel.util.FlxColor;

/**
 * ...
 * @author Joshua
 */
class J_Bar4 extends J_Bar 
{

	public function new(x:Float=0, y:Float=0, ?direction:FlxBarFillDirection, width:Int=100, height:Int=50, ?parentRef:Dynamic, variable:String="", min:Float=0, max:Float=100, showBorder:Bool=false) 
	{
		maxTime = 0.1;
		super(x, y, direction, width, height, parentRef, variable, min, max, showBorder);
		
		setParent(this, "time");
		set_fillDirection(RIGHT_TO_LEFT);
		text = new FlxText(x+width / 2 - 40,y+height / 2 - 5, 0, "Hacer explosivos", 8, false);
		createFilledBar(0xffff0000, 0xff000000, true, 0xffffffff);
		
		addToTheWorld();
	}
	
	override function action():Void 
	{
		super.action();
		
		Resources.polvora--;
		Resources.explosivos++;
	}
	
}