import Date;

var desktopShiz:Array<FlxSprite> = [];
var time = new FlxText(1200, 920).setFormat(null, 17);

function create(){
	for(a in [
		new FlxSprite().loadGraphic(Paths.image("menus/windows ex pee/WINDOWS_BG")),
		new FlxSprite(-12, 724).loadGraphic(Paths.image("menus/windows ex pee/TASKBAR"))
	])
		add(a);
	for(b in ["recycle_bin", "untitled", "log_off", "weekone"]){
	}
}

function update(elapsed){
	var yeah = Std.string(Date.now()).split(" ")[1].split(":");
	time.text = yeah[0] + ":" + yeah[1];
	if(FlxG.keys.justPressed.SEVEN) FlxG.switchState(new FreeplayState());
	if(FlxG.keys.justPressed.SIX) FlxG.switchState(new MainMenuState());
}