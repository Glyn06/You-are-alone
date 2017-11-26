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
 * @author Glyn & Alexander
 */
class J_Bar extends FlxBar 
{
	private var text:FlxText;
	private var flicker:FlxFlicker;
	public var time(default, set):Float = 0;
	public var maxTime(get, null):Float;
	public var startTime(default, set):Bool = false;
	
	
	public function new(x:Float=0, y:Float=0, ?direction:FlxBarFillDirection, width:Int=100, height:Int=50, ?parentRef:Dynamic, variable:String="", min:Float=0, max:Float=100, showBorder:Bool=false) 
	{
		super(x, y, direction, width, height, parentRef, variable, min, max, showBorder);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed) 
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
	
	function set_startTime(value:Bool):Bool 
	{
		return startTime = value;
	}
	
	function set_time(value:Float):Float 
	{
		return time = value; 
	}
	
	function get_maxTime():Float 
	{
		return maxTime;
	}
	
	function addToTheWorld():Void
	{
		FlxG.state.add(this);
		FlxG.state.add(text);
	}
	
	function action():Void
	{
		FlxFlicker.flicker(this, 0.2, 0.06, true, false);
		FlxFlicker.flicker(text, 0.2, 0.06, true, false);
		//FlxG.camera.shake(0.01, 0.5);
	}
	
}
