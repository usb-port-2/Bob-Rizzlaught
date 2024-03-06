import flixel.addons.display.FlxBackdrop;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.utils.ShaderResizeFix;

var backdrop = new FlxBackdrop(Paths.image("menus/title/backdrop"));
var logo = new FlxSprite().loadGraphic(Paths.image("menus/title/logo"));
var text = new FlxText(0, 0, 0, "PRESS ENTER").setFormat(null, 50).setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 2.5);
var fisheye = new CustomShader("fisheye");
var enterUnpressed:Bool = true;
var time:Float = 0;

function create(){
	FlxG.resizeWindow(1024, 768);
	FlxG.resizeGame(1024, 768);
	FlxG.scaleMode.width = 1024;
	FlxG.scaleMode.height = 768;
	ShaderResizeFix.doResizeFix = true;
	ShaderResizeFix.fixSpritesShadersSizes();

	CoolUtil.playMenuSong();
	FlxG.camera.addShader(fisheye);
	fisheye.data.MAX_POWER.value = [0.25];
	logo.scale.set(0.5, 0.5);
	for(a in [backdrop, logo, text]) add(a.screenCenter());
	logo.y -= 25;
	FlxTween.tween(logo, {y: logo.y + 50}, 1, {ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});
	text.y = FlxG.height - 100;
}

function update(elapsed){
	backdrop.x += elapsed * 120;
	backdrop.y += elapsed * 120;
	if(controls.ACCEPT && enterUnpressed){
		CoolUtil.playMenuSFX(1);
		enterUnpressed = false;
		FlxG.camera.flash(FlxColor.WHITE, 0.5);
		FlxTween.tween(logo, {alpha: 0}, 0.25);
		FlxTween.tween(text, {alpha: 0}, 0.25, {onComplete: function(twn) FlxG.switchState(new FreeplayState())});
	}
}

function beatHit(curBeat:Int){
    FlxG.camera.zoom = 1.2;
    FlxTween.globalManager.cancelTweensOf(FlxG.camera); 
    FlxTween.tween(FlxG.camera, {zoom: 1}, 0.5, {ease: FlxEase.circOut});
}