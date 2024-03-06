import flixel.tweens.FlxTween;

var camGameBop:Bool = false;
player.cpu = true;
function create(){
    var text = new FlxText(5, 200, 0, "Sunshine (Old)\nSong: Pumpkin\nArt: Boru\nCode: Care").setFormat(null, 50, FlxColor.GRAY);
    text.camera = camHUD;
    add(text);
    text.screenCenter();
    text.x = 175;
    text.y = 400;
    FlxTween.tween(text, {alpha: 0}, 6.0, {startDelay: 3});
}

function beatHit(curBeat:Int){
    if(camGameBop){
        camGame.angle = curBeat % 2 == 0 ? 3 : -3;
        FlxTween.globalManager.cancelTweensOf(camGame); 
        FlxTween.tween(camGame, {angle: 0}, 0.5, {ease: FlxEase.circOut});
    }
    switch(curBeat){
        case 65 | 66 | 67: defaultCamZoom += 0.5;
        case 68:
            camGame.flash(FlxColor.WHITE, 0.5);
            defaultCamZoom = 0.5;
            camGameBop = true;
        case 132:
            camGame.flash(FlxColor.WHITE, 0.5);
            defaultCamZoom = 0.7;
            camGameBop = false;
        case 164: camGameBop = true;
        case 196: defaultCamZoom = 0.6;
        case 260 | 262 | 264 | 266:
            camFollow.x = 100;
            camGameBop = false;
            defaultCamZoom += 0.25;
            camHUD.alpha -= 0.25;
    }
}