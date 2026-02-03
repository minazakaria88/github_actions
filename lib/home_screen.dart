import 'package:carousel_slider/carousel_slider.dart';
import 'package:flower/all_product_category_screen.dart';
import 'package:flower/hand_curated_screen.dart';
import 'package:flower/widgets/category_card.dart';
import 'package:flower/widgets/expression_card.dart';
import 'package:flower/widgets/feature_bloom_card.dart';
import 'package:flower/widgets/occasion_card.dart';
import 'package:flower/widgets/product_card.dart';
import 'package:flower/widgets/promotion_card.dart';
import 'package:flower/widgets/search_delegate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Assets.assetsFlowrista,
                      height: 40,
                      width: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          'Delivering To',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'Nasr City, Greater Cairo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: TextFormField(
                  onTap: () {
                    showSearch(context: context, delegate: CustomSearch());
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    label: Text("Search"),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      reverse: true,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 7),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      scrollPhysics: const BouncingScrollPhysics(),
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index, realIndex) => const PromotionCard(),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) => CategoryCard(),
                  ),
                ),
              ),
              SliverVerticalSpace(height: 32),
              SliverToBoxAdapter(
                child: Align(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Season’s',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: 'Top',
                          style: TextStyle(
                            color: const Color(0xFF4B0082),
                            fontSize: 32,
                            fontFamily: 'Rouge Script',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: const Color(0xFF4B0082),
                            fontSize: 24,
                            fontFamily: 'Rouge Script',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                            letterSpacing: -3.84,
                          ),
                        ),
                        TextSpan(
                          text: 'Picks',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                            letterSpacing: -0.40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => ProductCard(),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(child: ViewMoreButton(onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllProductCategoryScreen()));
              })),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: Align(
                  child: Text(
                    'Gift For Every Occasion',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Noto Serif TC',
                      fontWeight: FontWeight.w400,
                      height: 1.60,
                    ),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) => OccasionCard(),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Color(0xffEDE6F3)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(Assets.assetsCalendar),
                      SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Timeless love deserves perfect timing.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF4B0082),
                                fontSize: 14,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w600,
                                height: 1.54,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Save anniversaries, birthdays, and special days  we’ll remind you right on time',
                              maxLines: 2,

                              style: TextStyle(
                                color: const Color(0xFF343434),
                                fontSize: 14,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.w400,
                                height: 1.40,
                              ),
                            ),
                            SizedBox(height: 8),
                            SecondaryAppButton(
                              title: 'Set Reminder',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: Align(
                  child: Text(
                    'Best Sellers',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Noto Serif TC',
                      fontWeight: FontWeight.w600,
                      height: 1.60,
                    ),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) => ProductCard(),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(child: ViewMoreButton(onTap: () {})),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: Align(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Choose Your',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w500,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: 'Expression',
                          style: TextStyle(
                            color: const Color(0xFFD4AF37),
                            fontSize: 32,
                            fontFamily: 'Rouge Script',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) => ExpressionCard(),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: Align(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Featured',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: '  ',
                        ),
                        TextSpan(
                          text: 'Bloom',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w500,
                            height: 1.60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              FeatureBloomingList(),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: Align(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Shop For Your',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Noto Serif TC',
                            fontWeight: FontWeight.w600,
                            height: 1.60,
                          ),
                        ),
                        TextSpan(
                          text: 'Loved Ones',
                          style: TextStyle(
                            color: const Color(0xFF4B0082),
                            fontSize: 32,
                            fontFamily: 'Rouge Script',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) => CategoryCard(),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: Align(
                  child: Text(
                    'Our Partners',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Noto Serif TC',
                      fontWeight: FontWeight.w400,
                      height: 1.30,
                      letterSpacing: -0.41,
                    ),
                  ),
                ),
              ),
              SliverVerticalSpace(),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CachedImageWidget(
                       imageUrl:  'data:image/png;base64,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',
                          );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class FeatureBloomingList extends StatefulWidget {
  const FeatureBloomingList({
    super.key,
  });

  @override
  State<FeatureBloomingList> createState() => _FeatureBloomingListState();
}

class _FeatureBloomingListState extends State<FeatureBloomingList> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              controller:  controller,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => FeatureBloomCard(),
            )
          ),
          SizedBox(height: 16),
          SmoothPageIndicator(
              controller: controller,  // PageController
              count:  3,
              effect:  WormEffect(
                dotHeight: 5,
                dotWidth: 16,
                activeDotColor: Color(0xff4B0082),
                dotColor: Color(0xffECECEC),
              ),  // your preferred effect
              onDotClicked: (index){
              }
          )
        ],
      ),
    );
  }
}

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff4B0082), width: 1),
        ),
        child: Text(
          'View More Products',
          style: TextStyle(color: Color(0xff4B0082)),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SliverVerticalSpace extends StatelessWidget {
  const SliverVerticalSpace({super.key, this.height = 16});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: 16));
  }
}
