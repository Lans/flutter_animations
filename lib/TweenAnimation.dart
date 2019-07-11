import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TweenAnimationState();
  }
}

class TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    );
    animation = Tween<double>(begin: 10, end: 300).animate(animationController)
      ..addListener(() {
        //自动调用随animation的值
        setState(() {});
      })
      //监听状态
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        color: Colors.orange,
        height: animation.value,
        width: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
