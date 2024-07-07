import 'package:e_commerce_app/core/dimention.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  BigText({
    super.key,
    this.color = Colors.blue,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
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
        fontSize:size==0 ? Dimention.font20:size,
      ),
    );
  }
}
