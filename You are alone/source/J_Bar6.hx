package;

import flixel.FlxG;
import flixel.effects.FlxFlicker;
import flixel.effects.particles.FlxEmitter;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;

/**
 * ...
 * @author Joshua
 */
class J_Bar6 extends J_Bar
{
	public function new(x:Float=0, y:Float=0, ?direction:FlxBarFillDirection, width:Int=100, height:Int=50, ?parentRef:Dynamic, variable:String="", min:Float=0, max:Float=100, showBorder:Bool=false) 
	{
		maxTime = 3;
		super(x, y, direction, width, height, parentRef, variable, min, maxTime, showBorder);
		
		setParent(this, "time");
		set_fillDirection(RIGHT_TO_LEFT);
		text = new FlxText(x+width / 2 - 40,y+height / 2 - 5, 0, "Atacar!", 8, false);
		createFilledBar(0xffff0000, 0xff000000, true, 0xffffffff);
		
		
		
		addToTheWorld();
	}
	
	
	override function action():Void 
	{
		if (Resources.explosivos < 100) 
		{
			
		}
		else 
		{
			super.action();
			FlxG.camera.shake(0.01, 0.5);
			Resources.explosivos -= 100;
			if (Resources.aliens < 60+Resources.maquinas+Resources.empleados) 
			{
				Resources.aliens = 0;
			}
			else 
			{
				Resources.aliens -= 60;
				Resources.aliens -= Resources.maquinas;
				Resources.aliens -= Resources.empleados;
			}
		}
	}
	
}