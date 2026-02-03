import 'package:flower/hand_curated_screen.dart';
import 'package:flutter/material.dart';
import 'package:flower/widgets/app_button.dart';

class FeatureBloomCard extends StatelessWidget {
  const FeatureBloomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 17.70,
            offset: Offset(0, 0),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedImageWidget(
                imageUrl: 'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png',
                width: 140,
                height: 150,
              ),
              const SizedBox(height: 8),
              Text(
                'Rosing Shine',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                maxLines: 2,
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CachedImageWidget(
                         imageUrl:  'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'Patchi Chocolate Box - 500 Gm',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    BloomItem(),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return const BundleOptionsBottomSheet();
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Explore This Gift',
                        style: TextStyle(
                          color: Color(0xff4B0082),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xff4B0082),
                        size: 16,
                      ),
                    ],
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

class BloomItem extends StatelessWidget {
  const BloomItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedImageWidget(
          imageUrl: 'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png',
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            'Patchi Chocolate Box - 500 Gm',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class BundleOptionsBottomSheet extends StatefulWidget {
  const BundleOptionsBottomSheet({super.key});

  @override
  State<BundleOptionsBottomSheet> createState() => _BundleOptionsBottomSheetState();
}

class _BundleOptionsBottomSheetState extends State<BundleOptionsBottomSheet> {
  final Set<String> selectedOptions = {};

  final List<BundleOption> bundleOptions = [
    BundleOption(
      id: 'patchi',
      name: 'Patchi chocolates',
      price: '500 EGP',
      imageUrl: 'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png',
    ),
    BundleOption(
      id: 'necklace',
      name: 'Diamond Neckless',
      price: '500 EGP',
      imageUrl: 'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Draggable handle
          SizedBox(height: 12),
          Container(
            width: 56,
            height: 3,
            decoration: BoxDecoration(
              color: Color(0xFFDDDDDD),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          SizedBox(height: 19),
          // Title
          Text(
            'Rosing Shine',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          // Product Image
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CachedImageWidget(
               imageUrl:  'https://png.pngtree.com/png-vector/20240903/ourmid/pngtree-flower-bouquet-png-image_13740304.png',
              ),
            ),
          ),
          SizedBox(height: 20),
          // Options Header
          Text(
            'Choose Your Options',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          // Bundle Options List
          Expanded(
            flex: 2,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: bundleOptions.length,
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final option = bundleOptions[index];
                final isSelected = selectedOptions.contains(option.id);
                return BundleOptionCard(
                  option: option,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedOptions.remove(option.id);
                      } else {
                        selectedOptions.add(option.id);
                      }
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16),
          // Get This Bundle Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              firstText: 'Get This Bundle',
              showIcon: true,
              onTap: () {
                Navigator.of(context).pop();
                // Handle bundle purchase
              },
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class BundleOption {
  final String id;
  final String name;
  final String price;
  final String imageUrl;

  BundleOption({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class BundleOptionCard extends StatelessWidget {
  const BundleOptionCard({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  final BundleOption option;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xFFE1E1E1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? Color(0xFF4B0082)
                      : Color(0xFFE1E1E1),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isSelected
                    ? Color(0xFF4B0082)
                    : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16,
                    )
                  : null,
            ),
            SizedBox(width: 12),
            // Product Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFF5F5F5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedImageWidget(
                 imageUrl: option.imageUrl,
                ),
              ),
            ),
            SizedBox(width: 12),
            // Name and Price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    option.price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
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
}
