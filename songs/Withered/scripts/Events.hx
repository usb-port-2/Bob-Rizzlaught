var invert = new CustomShader("invert");

function create(){
    camHUD.alpha = 0;
    camGame.zoom = 1.5;
    camGame.fade(FlxColor.BLACK, .0000001);
    dad.color = boyfriend.color = gf.color = 0xbac2cf;
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
        case 208: FlxTween.tween(FlxG.camera, {zoom: 0.8}, 2, {ease: FlxEase.quadInOut});
        case 236: defaultCamZoom = 0.85;
        case 238: defaultCamZoom = 0.9;
        case 240:
            FlxTween.tween(camGame, {zoom: 0.75}, 6.2, {ease: FlxEase.sineInOut, onComplete: function(a) defaultCamZoom = 0.75});
            FlxTween.tween(camHUD, {alpha: 0}, 5, {ease: FlxEase.sineInOut});

    }
   trace(curBeat);
}

function stepHit(curStep:Int){
    switch(curStep){
        case 248: camGame.zoom = defaultCamZoom = 0.85;
        case 250 | 252: camGame.zoom = defaultCamZoom += 0.05;
        case 254: camGame.zoom = defaultCamZoom = 0.75;
        case 576: FlxTween.tween(camGame, {zoom: defaultCamZoom + 2}, 2.5, {ease: FlxEase.expoInOut});
        case 608: FlxTween.tween(camGame, {zoom: defaultCamZoom}, 2.5, {ease: FlxEase.expoInOut});
        case 640:
            for(a in [camGame, camHUD]) a.addShader(invert);
            invert.data.invert.value = [1];
            camGame.flash(FlxColor.BLACK, 0.5);
        case 702: defaultCamZoom = 0.81;
        case 703: 
            for(a in [camGame, camHUD]) a.removeShader(invert);
            camGame.flash(FlxColor.WHITE, 0.5);
    }
}

function leafThing(front:Bool){
    var leaf = new FlxSprite(-3000, FlxG.random.int(-120, 100));
    leaf.frames = Paths.getSparrowAtlas("bob/leaves");
    var rand = FlxG.random.int(1, 4);
    leaf.animation.addByPrefix('idle', 'LEAF_' + FlxG.random.int(1, 4) + ' ANIM', 24);
    leaf.animation.play('idle');
    insert(front ? members.indexOf(boyfriend) + 1 : 1, leaf);
    FlxTween.tween(leaf, {x: FlxG.width}, 0.6, {onComplete: function(twn) leaf.destroy()});
}