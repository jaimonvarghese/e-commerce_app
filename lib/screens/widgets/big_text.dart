import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    this.color = Colors.blue,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 20,
  });
  final Color color;
  final String text;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
