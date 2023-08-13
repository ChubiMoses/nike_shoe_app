import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
   const ShakeTransition({
    super.key,
     required this.child, 
     this.duration = const  Duration(milliseconds: 700), 
     this.offset = 140,
      this.axis =  Axis.horizontal, 
    this.right = true
    });
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final bool right;

  @override
  Widget build(BuildContext context) {
    return  TweenAnimationBuilder(
      duration: duration,
      curve: Curves.easeInOut,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (BuildContext context, double value, Widget? child){
        return Transform.translate(offset: right ? Offset(value*offset, value*offset) : Offset(value*offset, value*offset),
        child: child
        );
      },
      child:child,
    );
  }
}