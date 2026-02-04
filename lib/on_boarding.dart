import 'package:flower/generated/assets.dart';
import 'package:flower/home_screen.dart';
import 'package:flower/on_boarding_model.dart';
import 'package:flower_pac/flower_pac.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final color = Color(0xFF4B0082);

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();
  int currentIndex = 0;
   String? selectedValue;
   List<bool> isChecked = [false, false, false, false];
   List<bool> isChecked2 = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildText('text'),
          SizedBox(height: 60),
          OnBoardingHeaderWidget(controller: controller),
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) => Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 16,
                      ),
                      child: Image.asset(Assets.assetsPhone, fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                onBoardingList[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                onBoardingList[index].description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              if (index == 2)
                                AppButton(
                                  defaultStyle: false,
                                  firstText: 'Get Started',
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  showIcon: true,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingHeaderWidget extends StatelessWidget {
  const OnBoardingHeaderWidget({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: SlideEffect(
            activeDotColor: color,
            dotColor: Color(0xffECECEC),
            dotHeight: 8,
            dotWidth: 40,
            radius: 12,
          ),
        ),
        SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFFE1E1E1)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C363739),
                    blurRadius: 2,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(
                'العربية',
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<String> pages = [
  'Every flower tells a story.',
  "Be there, even from afar.",
  "Add your personal touch.",
];

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.firstText,
    this.secondText,
    this.showIcon = false,
    required this.onTap,
    this.defaultStyle = true,
  });
  final String firstText;
  final String? secondText;
  final bool showIcon;
  final VoidCallback onTap;
  final bool defaultStyle;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        color: !defaultStyle ? Colors.white : Color(0xff4B0082),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstText,
              style: TextStyle(
                color: !defaultStyle ? Color(0xff4B0082) : Colors.white,
              ),
            ),
            SizedBox(width: 8),
            if (secondText != null)
              Flexible(
                child: Text(
                  secondText!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            SizedBox(width: 16),
            if (showIcon)
              Icon(
                Icons.arrow_forward,
                color: !defaultStyle ? const Color(0xff4B0082) : Colors.white,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}
