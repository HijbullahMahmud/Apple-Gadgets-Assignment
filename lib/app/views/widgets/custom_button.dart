import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final Widget label;
  final double? width;
  final double? radius;
  final double? margin;
  final double? padding;
  final double? textSize;
  final Color? color;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.textColor,
    this.textSize,
    this.width,
    this.radius,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ?? 10),
      width: width ?? Get.width,
      child: MaterialButton(
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(radius ?? 10),
        //   ),
        // ),
        color: color ?? Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4),
        ),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.all(padding ?? 10),
          // child: Text(
          //   text,
          //   style: TextStyle(
          //       color: textColor ?? Colors.white,
          //       fontSize: textSize,
          //       fontWeight: FontWeight.bold),
          // ),
          child: label,
        ),
      ),
    );
  }
}
