import 'package:flutter/material.dart';

class TweenAnimationWidget extends AnimatedWidget {
  TweenAnimationWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          color: Colors.orange,
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
        ),
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
        CurvedAnimation(parent: animationController, curve: Curves.easeIn)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animationController.forward();
            }
          });
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
