function create(){
    camHUD.alpha = 0;
    camGame.zoom = 1.5;
    camGame.fade(FlxColor.BLACK, .0000001);
    dad.color = boyfriend.color = gf.color = 0xbac2cf;
    player.cpu = true;
}

function beatHit(curBeat:Int){
   if(curBeat % 8 == 0 && FlxG.random.bool(40))
        leafThing(FlxG.random.bool());
   switch(curBeat){
        case 4:
            FlxTween.tween(camGame, {zoom: 1.05}, 6.2, {ease: FlxEase.quadInOut});
            camGame.fade(0x0000000, 5, true);
        case 16: FlxTween.tween(camHUD, {alpha: 1}, 6, {ease: FlxEase.sineInOut});
        case 68: defaultCamZoom = 0.88;
        case 76: defaultCamZoom = 0.69;
        case 144: FlxTween.tween(camHUD, {alpha: 0}, 3, {ease: FlxEase.sineInOut});
        case 158: FlxTween.tween(camHUD, {alpha: 1}, 2, {ease: FlxEase.sineInOut});
        case 160: camFollow.setPosition(580, 140);
   }
   trace(curBeat);
}

function leafThing(front:Bool){
    var leaf = new FlxSprite(-3000, FlxG.random.int(-120, 100));
    leaf.frames = Paths.getSparrowAtlas("bob/leaves");
    var rand = FlxG.random.int(1, 4);
    leaf.animation.addByPrefix('idle', 'LEAF_' + FlxG.random.int(1, 4) + ' ANIM', 24);
    leaf.animation.play('idle');
    insert(front ? members.indexOf(boyfriend) + 1 : members.indexOf(ground) + 1, leaf);
    FlxTween.tween(leaf, {x: FlxG.width}, 0.6, {onComplete: function(twn) leaf.destroy()});
}