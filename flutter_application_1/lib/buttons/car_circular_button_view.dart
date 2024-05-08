import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';

class CarCircularButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Color circleColor;
  final Color iconColor;
  final VoidCallback onPressed;

  const CarCircularButton({super.key, 
    required this.iconData,
    required this.title,
    required this.circleColor,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: circleColor,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            child: Icon(
              iconData,
              size: 40,
              color: iconColor,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(color: ColorUtils.appWhite),
        ),
      ],
    );
  }
}