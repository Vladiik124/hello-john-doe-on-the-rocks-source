var hall:FlxSprite;
var bee:FlxSprite;
var snowworld:FlxSprite;
var outside:FlxSprite;

var ourEmitter;

function onCreate() {
    game.skipCountdown = true;
    outside = new FlxSprite(125, 280).loadGraphic(Paths.image('nice'));
    outside.scale.x = 2;
    outside.scale.y = 2;
    addBehindGF(outside);

    hall = new FlxSprite(220, 280).loadGraphic(Paths.image('evil'));
    hall.scale.x = 2;
    hall.scale.y = 2;
    addBehindGF(hall);
    hall.alpha = 0;


    snowworld = new FlxSprite(-28, 0).loadGraphic(Paths.image('snowworld'));
    addBehindGF(snowworld);
    snowworld.alpha= 0;

    bee = new FlxSprite(-100, 0).loadGraphic(Paths.image('bee'));
    addBehindGF(bee);
    bee.alpha = 0;

    game.camGame.alpha = game.camHUD.alpha = 0;

    ourEmitter = new FlxEmitter();
    addBehindDad(ourEmitter);
    ourEmitter.emitting = true;
    ourEmitter.launchMode = FlxEmitterMode.SQUARE;
    ourEmitter.makeParticles(8, 8, 0xFFFFFFFF, 200);
    ourEmitter.velocity.set(80, 0,-80,-700,0,0);
    ourEmitter.lifespan.set(3,4);
    ourEmitter.start(false, 0, 0);
    ourEmitter.frequency = 0.05;
    ourEmitter.alpha.set(1,1,0,0);
    ourEmitter.color.set(FlxColor.BLACK,FlxColor.PURPLE,FlxColor.BLACK,FlxColor.PURPLE);
    ourEmitter.width = 30;
}

function onUpdatePost(elapsed) {

    ourEmitter.x = dad.x + (dad.width - ourEmitter.width)/2;
    ourEmitter.y = dad.y + dad.height;
}

function updateEmitter(freq) {
    ourEmitter.frequency = freq;
}

function onSongStart() {
    for (i in [game.camGame, game.camHUD]) {
        FlxTween.tween(i, {alpha: 1},1, {ease: FlxEase.quadIn});
    }


    for (i in 0...game.opponentStrums.length){
        var note = game.opponentStrums.members[i];
        note.x = game.playerStrums.members[i].x;
        note.y = game.playerStrums.members[i].y;
        game.opponentStrums.members[i]
        note.alpha = 0;
        note.scrollFactor.set(1,1);
   }
}

function onEvent(ev,val1,val2,time) {
    switch (ev) {
        case 'hall': FlxTween.tween(hall, {alpha: Std.parseFloat(val1)},Std.parseFloat(val2));
        case 'snowpoo': FlxTween.tween(snowworld, {alpha: Std.parseFloat(val1)},Std.parseFloat(val2));
        case 'beepee': FlxTween.tween(bee, {alpha: Std.parseFloat(val1)},Std.parseFloat(val2));
        case 'forest': FlxTween.tween(outside, {alpha: 0},1, {ease: FlxEase.quadOut});
        case 'gf': FlxTween.tween(gf, {x: gf.x + -1100},(9.3), {ease: FlxEase.quadOut});
        case 'snow':
            snowworld.alpha= 1;
            hall.alpha = 0;   
        case 'bee':
            bee.alpha = 1;
            snowworld.alpha = 0;  
            
        case 'goodnight': 
            game.camGame.alpha = 0;  game.camHUD.alpha = 0;
            case 'goodmorning': 
                game.camGame.alpha = 1;  game.camHUD.alpha = 1;
        case 'flash1':
            FlxG.camera.flash(FlxColor.RED, 1.5);
        case 'flash2':
            FlxG.camera.flash(FlxColor.PURPLE, 1.5);
        case 'flash3':
            FlxG.camera.flash(FlxColor.YELLOW, 1.5);

        case '':
            if (val1 == 'emit') updateEmitter(Std.parseFloat(val2));
}
}