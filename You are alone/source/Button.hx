package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ...
 */
class Button extends FlxSprite
{
	public var button(default, set):FlxSprite;
	public var scrollOposite:Bool = false;
	public var timetopress:Float = 0;
	public var timerBool:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		new FlxSprite(FlxG.width-96,FlxG.height/2);
		makeGraphic(64, 64, 0xff171410);
		
		FlxG.state.add(this);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.mouse.overlaps(this)) 
		{
			this.makeGraphic(64, 64, 0xff180601);
		}
		else 
		{
			this.makeGraphic(64, 64, 0xff171410);
		}
		
		if (FlxG.mouse.overlaps(this) && FlxG.mouse.justPressed) 
		{
			action();
			timerBool = true;
		}
		
		
		if (timerBool == true) 
		{
			timetopress += elapsed;
		}
		
		if (timetopress >= 0.7) 
		{
			timetopress = 0;
			timerBool = false;
		}
	}
	
	public function action():Void
	{
		if (!scrollOposite && timetopress == 0)
		{
			FlxTween.tween(FlxG.camera.scroll, {x: FlxG.camera.scroll.x + 960}, 0.5, {type: FlxTween.ONESHOT});
			scrollOposite = true;
		}
		else if (timetopress == 0)
		{
			FlxTween.tween(FlxG.camera.scroll, {x: FlxG.camera.scroll.x - 960}, 0.5, {type: FlxTween.ONESHOT});
			scrollOposite = false;
		}
		
	}
	
	function set_button(value:FlxSprite):FlxSprite 
	{
		return button = value;
	}
	
}