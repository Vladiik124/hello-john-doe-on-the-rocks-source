/*package states;

import states.PlayMenu.PlayMenuState;
import flixel.input.mouse.FlxMouse;
import flixel.input.mouse.FlxMouseEvent;
import backend.CrossUtil;
import openfl.display.BitmapData;
import backend.Song;
import backend.Highscore;
import backend.WeekData;
import openfl.filters.ShaderFilter;
import flixel.addons.display.FlxGridOverlay;
import flixel.addons.display.FlxBackdrop;
import objects.SpriteFromSheet;
import objects.FunkinSprite;
import flixel.FlxObject;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import states.editors.MasterEditorMenu;
import options.OptionsState;
import sys.FileSystem;
import sys.io.File;
import haxe.Json;

//not gonna be used but I made this fast to quickly see what I need to have minimum for the transitions
class RocksMenu extends MusicBeatSubstate
{

	public static var finishCallback:Void->Void = null;

	var foodMenu:FlxSprite;
	var b0mbG4lButton:FlxSprite;

	public function new(?state:PlayMenuState) {
		super();
	}
	


	override function create()
	{
		#if DISCORD_ALLOWED
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Picking an awesome", null);
		#end


		FlxG.sound.playMusic(Paths.music('nightcore'), 0);
		cameras = [CrossUtil.quickCreateCam()];
		persistentUpdate = persistentDraw = true;

		foodMenu = new FlxSprite().loadGraphic(Paths.image('menu/rolbox/song/FoodMenu'));
		foodMenu.scale.x = 0.75;
		foodMenu.scale.y = 0.75;
		foodMenu.screenCenter();
		foodMenu.y += 30;

		b0mbG4lButton = new FlxSprite().loadGraphic(Paths.image('menu/rolbox/song/B0mbG4lButton'));
		b0mbG4lButton.screenCenter();
		b0mbG4lButton.x -= 160;
		b0mbG4lButton.y += 17;

		add(b0mbG4lButton);
		add(foodMenu);

		FlxG.mouse.visible = true;
		camera.zoom += 0.5;
		super.create();
	}
	

	override function update(elapsed:Float)
		{
			if (FlxG.keys.justPressed.FOUR) FlxG.resetState();
			if (controls.BACK)
				{
					FlxG.sound.play(Paths.sound('cancelMenu'));
					FlxTransitionableState.skipNextTransIn = FlxTransitionableState.skipNextTransOut = true;
					MusicBeatState.switchState(new MainMenuState());
					FlxG.mouse.visible = false;
				}
	
		
			if (FlxG.mouse.overlaps(b0mbG4lButton) && FlxG.mouse.justPressed) {
					trace("Clicked");
			}
			
			super.update(elapsed);
		}
		
		function loadSong() {
			trace('im dying');
			songName.text = FlxG.random.getObject(loadingTexts);
			selectedSomethin = true;
			var sound = FlxG.sound.play(Paths.sound('letsgo'));
			sound.persist = true;
			sound.autoDestroy = true;
	
			door.animation.play('transition');
			FlxG.sound.music.stop();
	
			FlxTransitionableState.skipNextTransIn = true;
			persistentUpdate = false;
	
			var songLowercase:String = Paths.formatToSongPath(songs[curSelected].songName);
			var poop:String = Highscore.formatSong(songLowercase, 1);
			trace(poop);
	
			try
			{
				PlayState.SONG = Song.loadFromJson(poop, songLowercase);
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 1;
	
				trace('CURRENT WEEK: ' + WeekData.getWeekFileName());
			}
			catch(e:Dynamic)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				selectedSomethin = false;
				update(FlxG.elapsed);
				return;
			}
			killControls();
			LoadingState.loadAndSwitchState(new PlayState());
					
			#if (MODS_ALLOWED && DISCORD_ALLOWED)
			DiscordClient.loadModRPC();
			#end
		}

}
*/