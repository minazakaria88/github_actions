import 'package:flower/hand_curated_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../generated/assets.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 186,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFDBCCE6),
      ),
      child: Stack(
        children: [
          // TEXT LAYER
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 16,
              bottom: 16,
              start: 16,
              end: 130, // reserve space for image (safe zone)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with more padding
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    end: 8, // extra padding for title
                  ),
                  child: Text(
                    'Hand Curated Collections',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Hand Curated Collections',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                // Button
                SecondaryAppButton(
                  title: 'View Collection',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HandCuratedScreen(),));
                  },
                ),
              ],
            ),
          ),

          // IMAGE LAYER
          PositionedDirectional(
            end: 0,
            top: 0,
            child: Transform.scale(
              scaleX: 1, // Todo : check for the language
              child: SvgPicture.asset(
                Assets.assetsPromotionImage,
                width: 130,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondaryAppButton extends StatelessWidget {
  const SecondaryAppButton({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(color: Color(0xff4B0082)),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child:  Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
