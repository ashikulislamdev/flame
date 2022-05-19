import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame{
  @override
  Future<void> onLoad() async{
    SpriteComponent girl = SpriteComponent();
    SpriteComponent boy = SpriteComponent();
    SpriteComponent bgImg = SpriteComponent();

    const double charSize = 200.00;
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
      ..y = screenHeight - charSize - textBoxHeight;
    add(girl);

    boy
      ..sprite = await loadSprite('boy.png')
      ..size = Vector2(charSize, charSize)
      ..y = screenHeight - charSize - textBoxHeight
      ..x = screenWidth - charSize;
    add(boy);
  }
}