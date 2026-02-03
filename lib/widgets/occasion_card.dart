import 'package:flower/hand_curated_screen.dart';
import 'package:flutter/material.dart';

class OccasionCard extends StatelessWidget {
  const OccasionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xffEDE6F3),
          ),
          child: CachedImageWidget(
           imageUrl:  'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png',
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Anniversary',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          maxLines: 2,
        ),
      ],
    );
  }
}
