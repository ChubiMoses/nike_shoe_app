import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
   final EdgeInsetsGeometry? padding;
   final Color? color;
   final VoidCallback? onTap;
   final double height;
   final double width;
   final Widget child;
  const CustomButton({
    super.key, this.borderRadius, 
    this.margin, 
    this.padding,
    required this.child,
    this.height = 50,
    this.width = 50, 
    this.color, 
     this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: color??Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          margin: margin,
          padding: padding,
          width: width,
          height: height,
          child: child ,
        ),
      ),
    );
  }
}