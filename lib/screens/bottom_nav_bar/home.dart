import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  final String title = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController logoController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late Animation<double> logoAnimation =
      Tween<double>(begin: 50, end: 150).animate(logoController)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            logoController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            logoController.forward();
          }
        })
        ..addListener(() {
          setState(() {});
        });

  late AnimationController logoWidgetController =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late Animation<double> logoWidgetAnimation =
      CurvedAnimation(parent: logoWidgetController, curve: Curves.easeIn)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            logoWidgetController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            logoWidgetController.forward();
          }
        });

  late AnimationController logoWidgetUsingBuilderController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late Animation<double> logoWidgetUsingBuilderAnimation =
      Tween<double>(begin: 50, end: 150)
          .animate(logoWidgetUsingBuilderController)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            logoWidgetUsingBuilderController.reverse();
          } else if (status == AnimationStatus.dismissed) {
            logoWidgetUsingBuilderController.forward();
          }
        });
  late AnimationController logoWidgetStaggeredController = AnimationController(
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  );
  late Animation<double> logoWidgetStaggeredAnimationOpacity = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(
    CurvedAnimation(
      parent: logoWidgetStaggeredController,
      curve: const Interval(
        0.0,
        0.100,
        curve: Curves.ease,
      ),
    ),
  );
  late Animation<double> logoWidgetStaggeredAnimationWidth = Tween<double>(
    begin: 50.0,
    end: 150.0,
  ).animate(
    CurvedAnimation(
      parent: logoWidgetStaggeredController,
      curve: const Interval(
        0.125,
        0.250,
        curve: Curves.ease,
      ),
    ),
  );
  late Animation<double> logoWidgetStaggeredAnimationHeight =
      Tween<double>(begin: 50.0, end: 150.0).animate(
    CurvedAnimation(
      parent: logoWidgetStaggeredController,
      curve: const Interval(
        0.250,
        0.375,
        curve: Curves.ease,
      ),
    ),
  );
  late Animation<EdgeInsets> logoWidgetStaggeredAnimationPadding =
      EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 16.0),
    end: const EdgeInsets.only(bottom: 75.0),
  ).animate(
    CurvedAnimation(
      parent: logoWidgetStaggeredController,
      curve: const Interval(
        0.250,
        0.375,
        curve: Curves.ease,
      ),
    ),
  );
  late Animation<BorderRadius?> logoWidgetStaggeredAnimationBorderRadius =
      BorderRadiusTween(
    begin: BorderRadius.circular(4.0),
    end: BorderRadius.circular(75.0),
  ).animate(
    CurvedAnimation(
      parent: logoWidgetStaggeredController,
      curve: const Interval(
        0.375,
        0.500,
        curve: Curves.ease,
      ),
    ),
  );
  late Animation<Color?> logoWidgetStaggeredAnimationColor =
      ColorTween(begin: Colors.indigo[100], end: Colors.orange[400]).animate(
    CurvedAnimation(
      parent: logoWidgetStaggeredController,
      curve: const Interval(
        0.500,
        0.750,
        curve: Curves.ease,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    changeLogoSize();
    changeLogoWidgetSize();
    changeLogoWidgetUsingBuilderSize();
    startBoxAnim();
  }

  void changeLogoSize() {
    logoController.forward();
  }

  void changeLogoWidgetSize() {
    logoWidgetController.forward();
  }

  void changeLogoWidgetUsingBuilderSize() {
    logoWidgetUsingBuilderController.forward();
  }

  void startBoxAnim() async {
    while (true) {
      await logoWidgetStaggeredController.forward().orCancel;
      await logoWidgetStaggeredController.reverse().orCancel;
    }
  }

  Widget animatedLogo() => SizedBox(
        width: logoAnimation.value,
        height: logoAnimation.value,
        child: const Expanded(child: FlutterLogo()),
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          animatedLogo(),
          AnimatedLogoWidget(
            animation: logoWidgetAnimation,
          ),
          GrowTransition(
            child: const FlutterLogo(),
            animation: logoWidgetUsingBuilderAnimation,
          ),
          Container(
            padding: logoWidgetStaggeredAnimationPadding.value,
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: logoWidgetStaggeredAnimationOpacity.value,
              child: Container(
                width: logoWidgetStaggeredAnimationWidth.value,
                height: logoWidgetStaggeredAnimationHeight.value,
                decoration: BoxDecoration(
                  color: logoWidgetStaggeredAnimationColor.value,
                  border: Border.all(
                    color: Colors.indigo[300]!,
                    width: 3.0,
                  ),
                  borderRadius: logoWidgetStaggeredAnimationBorderRadius.value,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    logoController.dispose();
    logoWidgetController.dispose();
    logoWidgetUsingBuilderController.dispose();
    logoWidgetStaggeredController.dispose();
    super.dispose();
  }
}

class AnimatedLogoWidget extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0, end: 1);
  static final _sizeTween = Tween<double>(begin: 50, end: 200);

  const AnimatedLogoWidget({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: SizedBox(
        width: _sizeTween.evaluate(animation),
        height: _sizeTween.evaluate(animation),
        child: const Expanded(
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({required this.child, required this.animation, Key? key})
      : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
