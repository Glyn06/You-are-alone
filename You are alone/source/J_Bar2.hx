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
		maxTime = 0.1;
		super(x, y, direction, width, height, parentRef, variable, 0, maxTime, showBorder);
		
		setParent(this, "time");
		set_fillDirection(RIGHT_TO_LEFT);
		text = new FlxText(x+width / 2 - 50,y+height / 2 - 5, 0, "Mejorar Empleados", 8, false);
		createFilledBar(0xffff0000, 0xff000000, true, 0xffffffff);
		
		addToTheWorld();
	}
	
	override public function update(elapsed:Float):Void 
	{	
		if (Resources.recursos != 0 && FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed) 
			startTime = true;
		
		if (startTime == true) 
		{
			time += elapsed;
			if (time >= maxTime) 
			{
				action();
				time = 0;
				startTime = false;
			}
		}
	}
	
	override public function action():Void 
	{
		super.action();
		
		Resources.empleados++;
		Resources.recursos--;
	}
}