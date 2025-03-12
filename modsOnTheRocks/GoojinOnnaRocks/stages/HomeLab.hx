var house:FlxSprite;

function onCreate() {
    game.skipCountdown = true;
    house = new FlxSprite(-800, -450).loadGraphic(Paths.image('HouseOnnaRocks'));
    house.scale.x = 1;
    house.scale.y = 1;
    addBehindGF(house);
}