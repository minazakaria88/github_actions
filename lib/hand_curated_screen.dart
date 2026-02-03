import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower/generated/assets.dart';
import 'package:flower/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HandCuratedScreen extends StatelessWidget {
  const HandCuratedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hand Curated')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Text(
                'Our thoughtfully bundled gifts for your new love, deep love, and every chapter in between.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => HandCuratedListItem(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 40),
                itemCount: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HandCuratedListItem extends StatelessWidget {
  const HandCuratedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: CachedImageWidget(
            width: double.infinity,
            height: 200.h,
            imageUrl: 'https://m.media-amazon.com/images/I/71+EtpEhmmL.jpg',
          ),
        ),

        const SizedBox(height: 8),
        Text(
          'First Valentine',
          style: TextStyle(
            color: const Color(0xFF4B0082),
            fontSize: 20,
            fontFamily: 'Noto Serif TC',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your first deserves something Special  ',
          style: TextStyle(
            color: const Color(0xFF6B4423),
            fontSize: 16,
            fontFamily: 'Sora',
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '3,500 EGP',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF343434),
            fontSize: 18,
            fontFamily: 'Sora',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        HandCuratedItem(),
        const SizedBox(height: 8),
        HandCuratedItem(),
        SizedBox(height: 12),
        AppButton(firstText: 'SEND THIS GIFT', onTap: () {}),
      ],
    );
  }
}

class HandCuratedItem extends StatelessWidget {
  const HandCuratedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        spacing: 12,
        children: [
          CachedImageWidget(
            imageUrl: 'https://m.media-amazon.com/images/I/71+EtpEhmmL.jpg',
            width: 69.w,
            height: 72.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  'Red roses ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF4B0082),
                    fontSize: 16,
                    fontFamily: 'Noto Serif TC',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'The universal language of romance and new love',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });
  final String imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.fill,
      width: width,
      height: height,
      placeholder: (context, url) => Image.asset(Assets.assetsLoading),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
