package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxEmitter;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;

class PlayState extends FlxState
{
	private var bar2:J_Bar2;
	private var bar3:J_Bar3;
	private var bar4:J_Bar4;
	private var bar5:J_Bar5;
	private var bar6:J_Bar6;
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
	private var CantAliens:FlxText;
	
	private var timerGenerador:Float = 0;
	private var timerGenerador_end:Float = 1;
	
	private var doNOTcomeback = false;
	private var doNOTcomebackEXP = false;
	private var DONTYOUFUCKINGDARE = false;
	private var ITS_TIME = false;
	private var startAlienInvasion = false;
	
	private var counter:Int = 0;
	
	
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
		
		CantAliens = new FlxText(650, 636, 0, "Aliens: " + Resources.aliens, 32);
		add(CantAliens);
		
		marco = new Marco(0, 0);
		marco2 = new Marco(960, 0);
		marco3 = new Marco(1920, 0);
		b = new Button(FlxG.width -32,FlxG.height/2);
		b2 = new Button(FlxG.width * 2 - 32, FlxG.height / 2);
		
		bar4 = new J_Bar4(32, 80); //+150 entre barras
		
		maquinasLvl.kill();
		empleadosLvl.kill();
		CantRecursos.kill();
		CantAliens.kill();
		marco2.kill();
		marco3.kill();
		b.kill();
		b2.kill();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		updateText();
		
		if (doNOTcomeback == false && Resources.explosivos >= 100)
		{
			//audio auto generadores de polvora disponibles
			bar3 = new J_Bar3(32, 150);
			doNOTcomeback = true;
		}
		
		if (doNOTcomebackEXP == false && Resources.explosivos >= 500) 
		{
			//audio mejora de maquinas y empleados
			bar2 = new J_Bar2(32, 220);
			bar5 = new J_Bar5(182, 220);
			maquinasLvl.revive();
			empleadosLvl.revive();
			CantRecursos.revive();
			ITS_TIME = true;
			doNOTcomebackEXP = true;
		}
		
		if (DONTYOUFUCKINGDARE == false && Resources.explosivos >= 1000) 
		{
			//audio nos invaden los aliens
			bar6 = new J_Bar6(64, 636);
			CantAliens.revive();
			startAlienInvasion = true;
			DONTYOUFUCKINGDARE = true;
		}
		
		if 	(counter == 0 && Resources.explosivos >= 600) 
		{
			//audio mas recursos
			Resources.recursos++;
			counter++;
		}
		
		if 	(counter == 1 && Resources.explosivos >= 650) 
		{
			Resources.recursos++;
			counter++;
		}
		
		if 	(counter == 2 && Resources.explosivos >= 800) 
		{
			Resources.recursos++;
			counter++;
		}
		
		if 	(counter == 3 && Resources.explosivos >= 850) 
		{
			Resources.recursos++;
			counter++;
		}
		
		if 	(counter == 4 && Resources.explosivos >= 1000) 
		{
			Resources.recursos++;
			counter++;
		}
		
		
		timerGenerador += elapsed;
		if (timerGenerador >= timerGenerador_end)
		{
			Resources.polvora += Resources.empleados;
			
			if (Resources.polvora <= 0) 
			{
				
			}
			else 
			{
				Resources.polvora -= Resources.generadoresEXP;
				Resources.explosivos += Resources.generadoresEXP;
			}
			
			if (startAlienInvasion == true && Resources.aliens != 0)
			{
				Resources.aliens += 2;
			}
			
			timerGenerador = 0;
		}
		
		if (Resources.aliens == 0) 
		{
			FlxG.switchState(new WinState());
		}
	}
	
	public function updateText():Void//////////////////////////////////////////////////////////////////////////////////////
	{
		if (Resources.polvora > Resources.polvora-1 || Resources.polvora !=0 && Resources.polvora < Resources.polvora+1) //Update del texto polvora
		{
			polvoText.destroy();
			polvoText = new FlxText(32, 32, 0, "Polvora: " + Resources.polvora, 16);
			add(polvoText);
		}
		
		if (Resources.explosivos > Resources.explosivos-1 || Resources.explosivos != 0 && Resources.explosivos < Resources.explosivos+1) //Update del texto explosivos
		{
			exploText.destroy();
			exploText = new FlxText(32, 48, 0, "Explosivos: " + Resources.explosivos, 16);
			add(exploText);
		}
		
		if (ITS_TIME == true && Resources.maquinas > Resources.maquinas-1 || ITS_TIME == true && Resources.maquinas < Resources.maquinas+1) //Update de texto maquinas
		{
			maquinasLvl.destroy();
			maquinasLvl = new FlxText(312, 236, 0, "Nivel Maquinas: " + Resources.maquinas, 16);
			add(maquinasLvl);
		}
		
		if (ITS_TIME == true && Resources.empleados > Resources.empleados-1 || ITS_TIME == true && Resources.empleados < Resources.empleados+1) //Update de texto empleados
		{
			empleadosLvl.destroy();
			empleadosLvl = new FlxText(312, 252, 0, "Nivel Empleados: " + Resources.empleados, 16);
			add(empleadosLvl);
		}
		
		if (ITS_TIME == true && Resources.recursos > Resources.recursos-1 && Resources.recursos < Resources.recursos+1) //Update de texto recursos
		{
			CantRecursos.destroy();
			CantRecursos = new FlxText(312, 220, 0, "Recursos: " + Resources.recursos, 16);
			add(CantRecursos);
		}
		
		if (startAlienInvasion == true && Resources.aliens > Resources.aliens-1 || startAlienInvasion == true && Resources.aliens < Resources.aliens+1) //Update de texto aliens
		{
			CantAliens.destroy();
			CantAliens = new FlxText(650, 636, 0, "Aliens: " + Resources.aliens, 32);
			add(CantAliens);
		}
	}
}