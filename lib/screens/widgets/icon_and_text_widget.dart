import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/screens/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  double size;

  final Color iconColor;
   IconAndTextWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: size,
        ),
        kwidth5,
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
