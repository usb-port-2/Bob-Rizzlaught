import funkin.backend.utils.ShaderResizeFix;
import discord_rpc.DiscordRpc;
import Date;
import funkin.game.cutscenes.DialogueCutscene;

var rpcSong = (curSong == "cross court" ? "crosscourt" : curSong);

camHUD.width = 1024*2;
camHUD.height = 768;

function postCreate(){
    camHUD.x -= 150;
    for(a in [healthBar, healthBarBG, iconP1, iconP2, scoreTxt, missesTxt, accuracyTxt]) a.y += 50;
    for(b in strumLines.members[0]) {b.x += 65;}
    for(c in strumLines.members[1]) {c.x -= 25;}
}

function onSongStart() FlxG.stage.window.title = 'Vs Bob: Reslaught (Demo) | ' + PlayState.SONG.meta.name;