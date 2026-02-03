import 'package:flower/widgets/app_button.dart';
import 'package:flower/widgets/product_card.dart';
import 'package:flower/widgets/search_delegate_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'generated/assets.dart';

class AllProductCategoryScreen extends StatelessWidget {
  const AllProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Season’s Top Picks'),
        actions: [
          SizedBox(width: 8),
          ActionButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const SortWidget(),
              );
            },
            image: Assets.assetsSort,
          ),
          SizedBox(width: 8),
          ActionButton(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const FilterWidget(),
              );
            },
            image: Assets.assetsFilter,
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            TextFormField(
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
            SizedBox(height: 16),
            SizedBox(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) =>
                    CategoryListItem(isSelected: index == 0),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1.h / 1.7.h,
                ),
                itemBuilder: (context, index) => ProductCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          const IndicatorDialogWidget(),
          const SizedBox(height: 19),
          Text(
            'Sort',
            style: TextStyle(
              color: const Color(0xFF1A1C1E),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          FilterDropDownMenu(),
          const SizedBox(height: 12),
          FilterDropDownMenu(),
          const SizedBox(height: 12),
          FilterDropDownMenu(),
          const SizedBox(height: 12),
          FilterDropDownMenu(),
          const SizedBox(height: 12),
          FilterDropDownMenu(),
          const SizedBox(height: 20),
          AppButton(firstText: 'Show 100 Product', onTap: () {}),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FilterDropDownMenu extends StatelessWidget {
  const FilterDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F5F5),
      child: DropdownMenu(
        inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
        width: double.infinity,
        label: Text('Category'),
        initialSelection: null,
        dropdownMenuEntries: [
          DropdownMenuEntry(value: 0, label: 'option 0'),
          DropdownMenuEntry(value: 1, label: 'Option 1'),
          DropdownMenuEntry(value: 2, label: 'Option 2'),
          DropdownMenuEntry(value: 3, label: 'Option 3'),
        ],
      ),
    );
  }
}

class SortWidget extends StatelessWidget {
  const SortWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 12),
          const IndicatorDialogWidget(),
          SizedBox(height: 19),
          Text(
            'Sort',
            style: TextStyle(
              color: const Color(0xFF1A1C1E),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          RadioButtonList(),
        ],
      ),
    );
  }
}

class IndicatorDialogWidget extends StatelessWidget {
  const IndicatorDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 3,
      decoration: ShapeDecoration(
        color: const Color(0xFFDDDDDD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFFB799CD) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: const Color(0xFFE1E1E1), width: 1),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0C363739),
              blurRadius: 2,
              offset: Offset(0, 1),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 4,
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: ShapeDecoration(
                color: isSelected
                    ? const Color(0xFFF5F5F5)
                    : const Color(0xFFF5F5F5),
                shape: OvalBorder(),
              ),
            ),
            Text(
              'Anniversary',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 12,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onTap, required this.image});
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: Color(0xFFE1E1E1), width: 1),
        ),
        child: SvgPicture.asset(image),
      ),
    );
  }
}

class RadioButtonList extends StatefulWidget {
  const RadioButtonList({super.key});

  @override
  State<RadioButtonList> createState() => _RadioButtonListState();
}

class _RadioButtonListState extends State<RadioButtonList> {
  String? selectedValue = 'Recommended'; // Track selected value

  final List<String> options = [
    'Recommended',
    'New arrivals',
    'Best sellers',
    'By Price : High to Low',
    'By Price : Low to High',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: options.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final isSelected = selectedValue == options[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedValue = options[index];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          CustomRadioButton(isSelected: isSelected),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              options[index],
                              style: const TextStyle(
                                color: Color(0xFF1A1C1E),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            AppButton(firstText: 'Apply', onTap: () {}),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? const Color(0xFF4B0082)
              : const Color(0xFF4B0082).withOpacity(0.3),
          width: 2,
        ),
        color: isSelected ? const Color(0xFF4B0082) : Colors.transparent,
      ),
    );
  }
}
