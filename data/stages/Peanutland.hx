var balloons:Array<FlxSprite> = [];
var balloonPos:Array<Float> = [];
var balloonMulti:Array<Int> = [];

var balloonFront = new FlxSprite(1750, 1050).loadGraphic(Paths.image("stages/peanutland/balloon"));

function create(){
    camGame.addShader(new CustomShader("dither"));
    for(a in 0...4){
        var balloon = new FlxSprite(FlxG.random.float(-100, 2000), FlxG.random.float(-50, 110)).loadGraphic(Paths.image("stages/peanutland/balloon"));
        balloon.scrollFactor.set(1.1);
        var scale = FlxG.random.float(0.65, 1.1);
        balloon.scale.set(scale, scale);
        balloon.flipX = FlxG.random.bool();
        balloon.updateHitbox();
        for(a in balloons) while(balloon.overlaps(a)) a.x++;
        balloons.push(balloon);
        balloonPos.push(balloon.x);
        balloonMulti.push(FlxG.random.bool() ? FlxG.random.float(30, 70) : FlxG.random.float(-30, -70));
        insert(FlxG.random.bool() ? members.indexOf(boyfriend)+1 : members.indexOf(dad), balloons[a]);
    }
    add(balloonFront);
    balloonFront.flipX = FlxG.random.bool();
    balloonFront.scrollFactor.set(1.1, 0.5);
    balloonFront.scale.set(1.7, 1.7);
}

var uiBalloons:Array<Float> = [];
var time:Float = 0;

function update(elapsed){
    for(b in uiBalloons){
        b.x += elapsed * 60;
        b.y += Math.sin(time += elapsed)*0.5;
    }
    for(num => a in balloons){
        a.setPosition(balloonPos[num] + Math.sin(Conductor.songPosition/1000)*balloonMulti[num], Math.sin(Conductor.songPosition/1400)*balloonMulti[num]);
    }
    balloonFront.setPosition(1750 + Math.sin(Conductor.songPosition/1000)*-20, 1050 + Math.sin(Conductor.songPosition/1400)*-20);
}

function beatHit(curBeat:Int){
    if(curBeat % 4 == 0 && uiBalloons.length != 3 && FlxG.random.bool()){
        var uiBalloon = new FlxSprite(0, FlxG.random.float(0, FlxG.height/2)).loadGraphic(Paths.image("stages/peanutland/balloon"));
        var scale = FlxG.random.float(0.75, 1.1);
        uiBalloon.scale.set(scale, scale);
        uiBalloon.camera = camHUD;
        uiBalloon.updateHitbox();
        uiBalloons.push(uiBalloon);
        add(uiBalloons[uiBalloons.length-1]);
    }
}