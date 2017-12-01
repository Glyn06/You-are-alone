package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.effects.particles.FlxEmitter;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ffg
 */
class Marco
{
	public var lado(get, null):FlxSprite;
	public var lado2(get, null):FlxSprite;
	public var lado3(get, null):FlxSprite;
	public var lado4(get, null):FlxSprite;
	
	public var emmiter:FlxEmitter;
	public var emmiter2:FlxEmitter;
	public var emmiter3:FlxEmitter;
	public var emmiter4:FlxEmitter;

	public function new(x:Int = 0, y:Int = 0)
	{
		
		lado = new FlxSprite(x, y);
		lado.makeGraphic(32, FlxG.height, 0xff2f4f4f);
		
		FlxG.state.add(lado);
		
		lado2 = new FlxSprite(x, y);
		lado2.makeGraphic(x +FlxG.width,32, 0xff2f4f4f);
		
		FlxG.state.add(lado2);
		
		lado3 = new FlxSprite(x + 928, y);
		lado3.makeGraphic(32, FlxG.height, 0xff2f4f4f);
		
		FlxG.state.add(lado3);
		
		lado4 = new FlxSprite(x, y + 688);
		lado4.makeGraphic(FlxG.width,32, 0xff2f4f4f);
		
		FlxG.state.add(lado4);
		
		FlxTween.tween(lado, {alpha:0}, 3, {type: FlxTween.PINGPONG, ease: FlxEase.quadInOut});
		FlxTween.tween(lado2, {alpha:0}, 3, {type: FlxTween.PINGPONG,ease: FlxEase.quadInOut});
		FlxTween.tween(lado3, {alpha:0}, 3, {type: FlxTween.PINGPONG,ease: FlxEase.quadInOut});
		FlxTween.tween(lado4, {alpha:0}, 3, {type: FlxTween.PINGPONG, ease: FlxEase.quadInOut});
		
		emmiter = new FlxEmitter(x, y, 200);
		emmiter.makeParticles(5, 5, 0xff2f4f4f, 200);
		emmiter.start(false, 0.1, 0);
		
		emmiter2 = new FlxEmitter(x, y, 200);
		emmiter2.makeParticles(5, 5, 0xff2f4f4f, 200);
		emmiter2.start(false, 0.1, 0);
		
		emmiter3 = new FlxEmitter(x + 928, y, 200);
		emmiter3.makeParticles(5, 5, 0xff2f4f4f, 200);
		emmiter3.start(false, 0.1, 0);
		
		emmiter4 = new FlxEmitter(x, y + 688, 200);
		emmiter4.makeParticles(5, 5, 0xff2f4f4f, 200);
		emmiter4.start(false, 0.1, 0);
		
		FlxG.state.add(emmiter);
		FlxG.state.add(emmiter2);
		FlxG.state.add(emmiter3);
		FlxG.state.add(emmiter4);
	}
	
	public function kill():Void
	{
		lado.kill();
		lado2.kill();
		lado3.kill();
		lado4.kill();
	}
	
	public function revive():Void
	{
		lado.revive();
		lado2.revive();
		lado3.revive();
		lado4.revive();
	}
	
	function get_lado():FlxSprite 
	{
		return lado;
	}
	
	function get_lado2():FlxSprite 
	{
		return lado2;
	}
	
	function get_lado3():FlxSprite 
	{
		return lado3;
	}
	
	function get_lado4():FlxSprite 
	{
		return lado4;
	}
}