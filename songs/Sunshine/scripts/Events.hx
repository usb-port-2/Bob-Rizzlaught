var abber = new CustomShader("bloom");

function create(){
    camHUD.alpha = 0;
    camGame.fade(FlxColor.BLACK, 0.00000001);
    camGame.addShader(abber);
    camHUD.addShader(abber);
    abber.data.hDRthingy.value = [2];
}



function stepHit(curStep:Int){
    trace(curStep);
    switch(curStep){
        case 0:
            camGame.fade(FlxColor.BLACK, 20, true);
            FlxTween.num(0, 0.2, 20, {}, function(a) abber.data.chromatic.value = [a]);
        case 132: FlxTween.tween(camHUD, {alpha: 1}, 5);
        case 512: FlxTween.num(defaultCamZoom, 0.55, 1, {}, function(a) defaultCamZoom = a);
        case 543 | 575 | 606 | 638 | 653: defaultCamZoom += 0.1;
        case 671: defaultCamZoom = 0.6;
        case 1047:
            camGame.fade(FlxColor.BLACK, 7.5);
            FlxTween.tween(camHUD, {alpha: 0}, 15);
            FlxTween.num(defaultCamZoom, 0.4, 15, {}, function(a) defaultCamZoom = a);
    }
}

function postUpdate() {
    switch(strumLines.members[curCameraTarget].characters[0].getAnimName()) {
        case "singLEFT": camFollow.x -= 20;
        case "singDOWN": camFollow.y += 20;
        case "singUP": camFollow.y -= 20;
        case "singRIGHT": camFollow.x += 20;
    }
}