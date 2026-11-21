import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIconActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final double padding;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;

  const AppIconActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 20,
    this.padding = 6,
    this.backgroundColor = const Color(0x33FFFFFF),
    this.margin = const EdgeInsets.only(left: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: IconButton(
        onPressed: onPressed,
        icon: Container(
          padding: EdgeInsets.all(padding.r),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize.r,
          ),
        ),
      ),
    );
  }
}
