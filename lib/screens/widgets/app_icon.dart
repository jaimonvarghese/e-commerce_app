import 'package:e_commerce_app/core/dimention.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const AppIcon({
    super.key,
    required this.icon,
    this.backgroundColor = Colors.greenAccent,
    this.iconColor = Colors.black,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
          size: Dimention.iconSize18,
        ),
      ),
    );
  }
}
