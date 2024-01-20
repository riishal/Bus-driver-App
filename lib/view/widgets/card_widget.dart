import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
  });
  final String title;
  final String subtitle;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700),
                ),
                Text(subtitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Image.asset(image, scale: 3),
          ),
        ],
      ),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
    );
  }
}
