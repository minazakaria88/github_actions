import 'package:flower/hand_curated_screen.dart';
import 'package:flutter/material.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 92,
      child: Column(
        children: [
          Container(
            height: 92,
            width: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffEDE6F3),
            ),
            child: CachedImageWidget(
             imageUrl:    'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png'
              //fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hand Bouquet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
