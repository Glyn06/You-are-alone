package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;

class PlayState extends FlxState
{
	private var bar2:J_Bar2;
	private var bar3:J_Bar3;
	private var bar4:J_Bar4;
	private var marco:Marco;
	private var marco2:Marco;
	private var marco3:Marco;
	private var b:Button;
	private var b2:Button;
	
	private var polvoText:FlxText;
	private var exploText:FlxText;
	
	private var timerGenerador:Float = 0;
	private var timerGenerador_end:Float = 1;
	
	private var doNOTcomeback = false;
	
	
	override public function create():Void
	{
		super.create();
		
		polvoText = new FlxText(32, 32, 0, "Polvora: " + Resources.polvora, 16);
		add(polvoText);
		
		exploText = new FlxText(32, 48, 0, "Explosivos " + Resources.explosivos, 16);
		add(exploText);
		
		marco = new Marco(0, 0);
		marco2 = new Marco(960, 0);
		marco3 = new Marco(1920, 0);
		b = new Button(FlxG.width -32,FlxG.height/2);
		b2 = new Button(FlxG.width * 2 - 32, FlxG.height / 2);
		
		bar4 = new J_Bar4(32, 80);
		
		marco2.kill();
		marco3.kill();
		b.kill();
		b2.kill();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if (Resources.polvora > Resources.polvora-1 || Resources.polvora < Resources.polvora+1) //Update del texto polvora
		{
			polvoText.destroy();
			polvoText = new FlxText(32, 32, 0, "Polvora: " + Resources.polvora, 16);
			add(polvoText);
		}
		
		if (Resources.explosivos > Resources.explosivos-1 || Resources.explosivos < Resources.explosivos+1) //Update del texto explosivos
		{
			exploText.destroy();
			exploText = new FlxText(32, 48, 0, "Explosivos: " + Resources.explosivos, 16);
			add(exploText);
		}
		
		if (Resources.explosivos == 100 && doNOTcomeback == false)
		{
			//audio auto generadores de polvora disponibles
			bar3 = new J_Bar3(32, 150);
			doNOTcomeback = true;
		}
		
		
		timerGenerador += elapsed;
		if (Resources.generadoresPolv != 0 && timerGenerador >= timerGenerador_end)
		{
			Resources.polvora += Resources.generadoresPolv;
			timerGenerador = 0;
		}
		
	}
}