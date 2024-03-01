import flixel.addons.display.FlxBackdrop;

var clouds = new FlxBackdrop(Paths.image('stages/court/clouds'));
function create(){
    clouds.velocity.set(FlxG.random.float(0.7, 1.5), 1);
    clouds.setPosition(-500, -600);
    clouds.setGraphicSize(Std.int(clouds.width * 1));
    clouds.scrollFactor.set(0.45, 0.4);
    clouds.alpha = 0.8;
    insert(members.indexOf(sky) + 1, clouds);
}

function update(elapsed){
    clouds.x += (FlxG.random.int(1, 5)) / (240 / 60);
}