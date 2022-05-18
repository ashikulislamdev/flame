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
    super.onLoad();
    girl
      ..sprite = await loadSprite("girl.png")
      ..size = Vector2(200, 200)
      ..y = 100
      ..x = 100;
    add(girl);

    boy
      ..sprite = await loadSprite('boy.png')
      ..size = Vector2(200, 200)
      ..y = 300;
    add(boy);
  }
}