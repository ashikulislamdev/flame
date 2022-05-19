import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame{
  SpriteComponent girl = SpriteComponent();
  SpriteComponent boy = SpriteComponent();
  SpriteComponent bgImg = SpriteComponent();
  final double charSize = 200.00;
  bool turnAway = false;

  @override
  Future<void> onLoad() async{

    
    super.onLoad();
    final screenWidth = size[0];
    final screenHeight = size[1];
    const textBoxHeight = 96;

    add(bgImg 
    ..sprite = await loadSprite('game-bg.jpg')
    ..size = size);

    girl
      ..sprite = await loadSprite("girl.png")
      ..size = Vector2(charSize, charSize)
      ..y = screenHeight - charSize - textBoxHeight
      ..anchor = Anchor.topCenter;
    add(girl);

    boy
      ..sprite = await loadSprite('boy.png')
      ..size = Vector2(charSize, charSize)
      ..y = screenHeight - charSize - textBoxHeight
      ..x = screenWidth - charSize
      ..anchor = Anchor.topCenter
      ..flipHorizontally();
    add(boy);
  }

  @override
  void update(double dt){
    super.update(dt);
    if(girl.x < size[0]/2 - 100){
      girl.x += 30 * dt;
    }else if(turnAway == false){
      print("turn away");
      boy.flipHorizontally();
      turnAway = true;
    }
    if(boy.x > size[0]/2 - 50){
      boy.x -= 30 * dt;
    }
  }

}