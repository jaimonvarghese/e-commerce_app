import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/dimention.dart';
import 'package:e_commerce_app/screens/widgets/big_text.dart';
import 'package:e_commerce_app/screens/widgets/icon_and_text_widget.dart';
import 'package:e_commerce_app/screens/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AppColumn extends StatelessWidget {
  final String text;
  
  AppColumn({
    super.key,
    required this.text,
    
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimention.font26,
          color: Colors.black,
        ),
        kheight10,
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: Colors.blue,
                  size: 16,
                ),
              ),
            ),
            kwidth10,
            SmallText(text: "4.5"),
            kwidth5,
            SmallText(text: "1287"),
            kwidth5,
            SmallText(text: "comments"),
          ],
        ),
        kheight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: Colors.orange,
              size: Dimention.iconSize24,
            ),
            kwidth10,
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "1.7km",
              iconColor: Colors.blue,
              size: Dimention.iconSize24,
            ),
            kwidth10,
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "32min",
              iconColor: Colors.redAccent,
              size: Dimention.iconSize24,
            ),
          ],
        ),
      ],
    );
  }
}
