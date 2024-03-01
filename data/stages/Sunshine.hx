import flixel.addons.display.FlxBackdrop;

var clouds = new FlxBackdrop(Paths.image('stages/sunshine/clouds'));
function create(){
    clouds.velocity.set(1.2, 1);
    clouds.setPosition(-20, -355);
    clouds.setGraphicSize(Std.int(clouds.width * 1));
    clouds.scrollFactor.set(0.35, 0.65);
    clouds.alpha = 0.8;
    insert(members.indexOf(sun) + 1, clouds);
}

function update(elapsed){
    clouds.x += 1 / (240 / 60);
}