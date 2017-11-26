package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;

/**
 * ...
 * @author Glyn & Alexander
 */
class J_Bar3 extends J_Bar
{
	private var cantGenText:FlxText;

	public function new(x:Float=0, y:Float=0, ?direction:FlxBarFillDirection, width:Int=100, height:Int=50, ?parentRef:Dynamic, variable:String="", min:Float=0, max:Float=100, showBorder:Bool=false) 
	{
		maxTime = 60;
		super(x, y, direction, width, height, parentRef, variable, 0, maxTime, showBorder);
		
		setParent(this, "time");
		set_fillDirection(RIGHT_TO_LEFT);
		text = new FlxText(x,y+height / 2 - 5, 0, "ConstruirGenerador", 8, false);
		createFilledBar(0xffff0000, 0xff000000, true, 0xffffffff);
		cantGenText = new FlxText(x + 50, y + height / 2 - 5, 0, "Cantidad generadores: " + Resources.generadoresPolv, 8);
		FlxG.state.add(cantGenText);
		
		addToTheWorld();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (Resources.generadoresPolv > Resources.generadoresPolv-1 || Resources.generadoresPolv < Resources.generadoresPolv+1) //Update del texto generador
		{
			cantGenText.destroy();
			cantGenText = new FlxText(x + 100, y + height / 2 - 5, 0, "Cantidad generadores: " + Resources.generadoresPolv, 8);
			FlxG.state.add(cantGenText);
		}
	}
	
	override public function action():Void 
	{
		super.action();
		
		Resources.generadoresPolv++;
	}
	
}