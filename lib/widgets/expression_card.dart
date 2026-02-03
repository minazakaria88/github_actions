import 'package:flower/hand_curated_screen.dart';
import 'package:flutter/material.dart';

class ExpressionCard extends StatelessWidget {
  const ExpressionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: 200,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: CachedImageWidget(
            imageUrl: 'https://m.media-amazon.com/images/I/81Id1b2FIJL.jpg',
          ),
        ),
        Positioned(
          left: 42,
          bottom: 32,
          child: Text(
            'Romantic',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Rouge Script',
              fontWeight: FontWeight.w400,
              height: 1.60,
            ),
          ),
        ),
      ],
    );
  }
}
