import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/color_utils.dart';

class CircularButton extends StatelessWidget {
  final double size;
  final double iconSize;
  final String title;
  final VoidCallback onPressed;

  const CircularButton({
    Key? key,
    required this.size,
    required this.iconSize,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: ColorUtils.appGrey,
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: (size - iconSize) / 2,
              child: _buildIcon(Icons.keyboard_arrow_up),
            ),
            Positioned(
              top: (size - iconSize) / 2,
              left: size - iconSize,
              child: _buildIcon(Icons.keyboard_arrow_right),
            ),
            Positioned(
              top: size - iconSize,
              left: (size - iconSize) / 2,
              child: _buildIcon(Icons.keyboard_arrow_down),
            ),
            Positioned(
              top: (size - iconSize) / 2,
              left: 0,
              child: _buildIcon(Icons.keyboard_arrow_left),
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorUtils.appGreen,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: ColorUtils.appGreen.withOpacity(
                              0.99), // Adjust glow color and opacity
                          blurRadius:
                              10.0, // Adjust blur radius for glow effect
                        ),
                        Shadow(
                          color: ColorUtils.appGreen.withOpacity(
                              0.7), // Adjust glow color and opacity
                          blurRadius:
                              20.0, // Adjust blur radius for glow effect
                        ),
                        Shadow(
                          color: ColorUtils.appGreen.withOpacity(
                              0.5), // Adjust glow color and opacity
                          blurRadius:
                              30.0, // Adjust blur radius for glow effect
                        ),
                      ],
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorUtils.appGreen,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData) {
    return Icon(
      iconData,
      size: iconSize,
      color: ColorUtils.appGreen,
    );
  }
}
