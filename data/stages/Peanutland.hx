var balloons:Array<FlxSprite> = [];

function create(){
    for(a in 0...3){
        var balloon = new FlxSprite([-100, 1800, 530][a], [30, 110, -50][a]).loadGraphic(Paths.image("stages/peanutland/balloons"));
        balloon.scrollFactor.set(1.1);
        balloon.scale.set([1.1, 0.9, 0.65][a], [1.1, 0.9, 0.65][a]);
        balloons.push(balloon);
        add(balloons[a]);
    }
}

function update(elapsed){
    for(num => a in balloons)
        a.setPosition([
            1700 + Math.sin(Conductor.songPosition/1000)*40,
            Math.sin(Conductor.songPosition/1000)*40,
            530 + Math.sin(Conductor.songPosition/900)*70
        ][num], Math.sin(Conductor.songPosition/1400)*90);
}