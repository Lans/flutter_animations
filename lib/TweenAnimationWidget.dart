import 'package:flutter/material.dart';

class TweenAnimationWidget extends AnimatedWidget {
  TweenAnimationWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        color: Colors.orange,
        height: animation.value,
        width: animation.value,
      ),
    );
  }
}

//封装动画为Widget
class TweenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TweenWidgetState();
  }
}

class TweenWidgetState extends State<TweenWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    animation =
        Tween<double>(begin: 100, end: 200).animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationWidget(
      animation: animation,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
