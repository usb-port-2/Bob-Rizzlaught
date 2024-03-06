import funkin.backend.utils.NativeAPI;
import lime.graphics.Image;
import funkin.backend.system.Main;
import funkin.backend.utils.ShaderResizeFix;

var redirectStates:Map<FlxState, String> = [
    TitleState => "BobTitle",
    //MainMenuState => "BobMenu"
];

function preStateSwitch() {
    for (redirectState in redirectStates.keys()) 
        if (Std.isOfType(FlxG.game._requestedState, redirectState)) 
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}

function update(){
    if (FlxG.keys.justPressed.F6) NativeAPI.allocConsole();
}

function new(){
    windowShit();
    FlxG.stage.window.resizable = false;
	FlxG.stage.window.x = FlxG.stage.window.width/2;
}
function postStateSwitch(){if(FlxG.state != PlayState) windowShit();}
function windowShit(){
    FlxG.stage.window.setIcon(Image.fromBytes(Assets.getBytes(Paths.image('sys/icon16'))));
    FlxG.stage.window.title = "Vs Bob: Reslaught (Demo)";
	FlxG.resizeWindow(1024, 768);
	FlxG.resizeGame(1024, 768);
	FlxG.scaleMode.width = 1024;
	FlxG.scaleMode.height = 768;
	ShaderResizeFix.doResizeFix = true;
	ShaderResizeFix.fixSpritesShadersSizes();
}

function onDiscordPresenceUpdate(event){
	if(FlxG.state == PlayState) event.cancel();
}