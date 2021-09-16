import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlipView extends StatefulWidget {
  final Widget front, back;
  final int milliseconds;

  ///when set to true, the tile will flip from top to bottom, else tile will flip from left to right.
  final bool flipTopToBottom;

  // ignore: use_key_in_widget_constructors
  const FlipView({required this.front, required this.back, required this.milliseconds, required this.flipTopToBottom});

  @override
  _FlipViewState createState() => _FlipViewState();
}

class _FlipViewState extends State<FlipView> with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)..addListener(() {
      if (_animation.isDismissed) {
        Future.delayed(Duration(milliseconds: widget.milliseconds)).then((value) => _controller.forward());
      }
      else if (_animation.isCompleted) {
        Future.delayed(Duration(milliseconds: widget.milliseconds)).then((value) => _controller.reverse());
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context,  child) {
        bool isFront = _controller.value < .5;
        return widget.flipTopToBottom?
        Transform(
          transform: Matrix4.rotationY(math.pi),
          alignment: FractionalOffset.center,
          child: isFront ? widget.front : widget.back,
        )
            :Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(math.pi * _animation.value + (isFront ? 0 : math.pi)),
          alignment: FractionalOffset.center,
          child: isFront ? widget.front : widget.back,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}

class jd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          FlipView(
            back: Container(
              height: 50,
              width: 50,
              child: Icon(Icons.add),
              color: Colors.blue,
            ),
            front: Container(
              height: 50,
              width: 50,
              color: Colors.green,
              child: Icon(Icons.minimize),
            ),
            flipTopToBottom: true,
            milliseconds: 400,
          ),
          FlipView(
            back: Container(
              height: 50,
              width: 50,
              child: Icon(Icons.alarm),
              color: Colors.blue,
            ),
            front: Container(
              height: 50,
              width: 50,
              color: Colors.green,
              child: Icon(Icons.alarm_off),
            ),
            flipTopToBottom: true,
            milliseconds: 400,
          )
        ],
      ),
    );
  }
}
