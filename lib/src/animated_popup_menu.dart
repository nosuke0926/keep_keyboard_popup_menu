import 'package:flutter/material.dart';

/// Used to build the background of the popup menu. [child] is the content of
/// the popup menu.
typedef Widget PopupMenuBackgroundBuilder(
  BuildContext context,
  Widget child,
);

/// Implements the menu opening and closing animation.
class AnimatedPopupMenu extends StatefulWidget {
  final Widget child;
  final VoidCallback? onFullyOpened;
  final PopupMenuBackgroundBuilder backgroundBuilder;

  const AnimatedPopupMenu({
    Key? key,
    required this.child,
    required this.backgroundBuilder,
    this.onFullyOpened,
  }) : super(key: key);

  @override
  AnimatedPopupMenuState createState() => AnimatedPopupMenuState();
}

class AnimatedPopupMenuState extends State<AnimatedPopupMenu>
    with TickerProviderStateMixin {
  static const ENTER_DURATION = Duration(milliseconds: 220);
  late Tween<double> _colorTween;
  late Animation<double> _animation;
  late AnimationController _animationController;

  static const EXIT_DURATION = Duration(milliseconds: 260);

  @override
  void initState() {
    super.initState();

    _colorTween = Tween(begin: 0, end: 1);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = _colorTween.animate(_animationController);

    _animationController.forward().then((value) {
      if (widget.onFullyOpened != null) widget.onFullyOpened!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, child) {
        return Opacity(
          opacity: _colorTween.evaluate(_animation),
          child: child!,
        );
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, _) {
          return Opacity(
            opacity: _colorTween.evaluate(_animation),
            child: widget.backgroundBuilder(
              context,
              widget.child,
            ),
          );
        },
      ),
    );
  }

  Future<void> showMenu() async {
    _animationController.stop();
    await _animationController.forward();
  }

  Future<void> hideMenu() async {
    _animationController.stop();
    await _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
