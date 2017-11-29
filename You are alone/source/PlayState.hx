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
	private var bar5:J_Bar5;
	private var marco:Marco;
	private var marco2:Marco;
	private var marco3:Marco;
	private var b:Button;
	private var b2:Button;
	
	private var polvoText:FlxText;
	private var exploText:FlxText;
	private var maquinasLvl:FlxText;
	private var empleadosLvl:FlxText;
	private var CantRecursos:FlxText;
	
	private var timerGenerador:Float = 0;
	private var timerGenerador_end:Float = 1;
	
	private var doNOTcomeback = false;
	private var doNOTcomebackEXP = false;
	
	
	override public function create():Void
	{
		super.create();
		
		polvoText = new FlxText(32, 32, 0, "Polvora: " + Resources.polvora, 16);
		add(polvoText);
		
		exploText = new FlxText(32, 48, 0, "Explosivos: " + Resources.explosivos, 16);
		add(exploText);
		
		maquinasLvl = new FlxText(312, 236, 0, "Nivel Maquinas: " + Resources.maquinas, 16);
		add(maquinasLvl);
		
		empleadosLvl = new FlxText(312, 252, 0, "Nivel Empleados: " + Resources.empleados, 16);
		add(empleadosLvl);
		
		CantRecursos = new FlxText(312, 220, 0, "Recursos: " + Resources.recursos, 16);
		add(CantRecursos);
		
		marco = new Marco(0, 0);
		marco2 = new Marco(960, 0);
		marco3 = new Marco(1920, 0);
		b = new Button(FlxG.width -32,FlxG.height/2);
		b2 = new Button(FlxG.width * 2 - 32, FlxG.height / 2);
		
		bar4 = new J_Bar4(32, 80); //+150 entre barras
		
		maquinasLvl.kill();
		empleadosLvl.kill();
		CantRecursos.kill();
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
		
		if (doNOTcomeback == false && Resources.explosivos == 100)
		{
			//audio auto generadores de polvora disponibles
			bar3 = new J_Bar3(32, 150);
			doNOTcomeback = true;
		}
		
		if (doNOTcomebackEXP == false && Resources.explosivos == 500) 
		{
			//audio lanzamiento de explosivos disponible
			bar2 = new J_Bar2(32, 220);
			bar5 = new J_Bar5(182, 220);
			maquinasLvl.revive();
			empleadosLvl.revive();
			CantRecursos.revive();
			doNOTcomebackEXP = true;
		}
		
		
		timerGenerador += elapsed;
		if (Resources.generadoresEXP != 0 && timerGenerador >= timerGenerador_end)
		{
			Resources.polvora -= Resources.generadoresEXP;
			Resources.explosivos += Resources.generadoresEXP;
			timerGenerador = 0;
		}
		
	}
}