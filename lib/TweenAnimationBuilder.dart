import 'package:flutter/material.dart';

class SizeTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  SizeTransition({this.child, this.animation});

  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Container(
                  height: animation.value,
                  width: animation.value,
                  child: child,
                ),
            child: child),
      );
}

///
///  AnimatedBuilder 知道如何渲染过渡效果
///  但 AnimatedBuilder 不会渲染 widget，也不会控制动画对象。
///  使用 AnimatedBuilder 描述一个动画是其他 widget 构建方法的一部分。
///  如果只是单纯需要用可重复使用的动画定义一个 widget，可参考 AnimatedWidget.。
///
class TweenBuilderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TweenBuilderWidgetState();
  }
}

class TweenBuilderWidgetState extends State<TweenBuilderWidget>
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
    return SizeTransition(
      animation: animation,
      child: FlutterLogo(),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
