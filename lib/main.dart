import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with HasTappables{
  SpriteComponent girl = SpriteComponent();
  SpriteComponent boy = SpriteComponent();
  SpriteComponent bgImg = SpriteComponent();
  DialogButton dialogButton = DialogButton();
  final Vector2 buttonSize = Vector2(50.0, 50.0);

  final double charSize = 200.00;
  bool turnAway = false;
  int dialogLevel = 0;

  TextPaint dialogLevelTextPaint = TextPaint(style: const TextStyle(fontSize: 30, color: Colors.white));

  @override
  Future<void> onLoad() async{

    
    super.onLoad();
    final screenWidth = size[0];
    final screenHeight = size[1];
    const textBoxHeight = 100;
    

    add(bgImg 
    ..sprite = await loadSprite('game-bg.jpg')
    ..size = Vector2(size[0], size[1] - 100));

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

    dialogButton
      ..sprite = await loadSprite("play_next.png")
      ..size = buttonSize
      ..position = Vector2(size[0]- buttonSize[0] - 10, size[1] - buttonSize[1] - 10);
  }

  @override
  void update(double dt){
    super.update(dt);
    if(girl.x < size[0]/2 - 100){
      girl.x += 30 * dt;
      if(girl.x > 50 && dialogLevel == 0){
        dialogLevel = 1;
      }
      if(girl.x > 150 && dialogLevel == 1){
        dialogLevel = 2;
      }
    }else if(turnAway == false){
      //print("turn away");
      boy.flipHorizontally();
      turnAway = true;
      if(dialogLevel == 2){
        dialogLevel = 3;
      }

    }
    if(boy.x > size[0]/2 - 50){
      boy.x -= 30 * dt;
    }
  }
    
    @override
    void render(Canvas canvas){   //canvas as
      super.render(canvas);
      switch (dialogLevel) {
        case 1:
          dialogLevelTextPaint.render(
            canvas, 
            "Boltu: Mina, don't go you will die", 
            Vector2(10, size[1] - 100)
          );
          break;
        case 2:
          dialogLevelTextPaint.render(
            canvas, 
            "Mina: Boltu, I must fight for our village", 
            Vector2(10, size[1] - 100)
          );
          break;
        case 3:
          dialogLevelTextPaint.render(
            canvas, 
            "Boltu: What about?", 
            Vector2(10, size[1] - 100)
          );
          add(dialogButton);
          break;
      }
    }

}

class DialogButton extends SpriteComponent with Tappable{
  @override
  bool onTapDown(TapDownInfo event){
    try {
      print("We are able to move next screen");
      return true;
    } catch (error) {
      print("error");
      return false;
    }
  }
}