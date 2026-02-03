import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.firstText,
    this.secondText,
    this.showIcon=false, required this.onTap,
  });
  final String firstText;
  final String? secondText;
  final bool showIcon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        color: Color(0xff4B0082),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstText, style: TextStyle(color: Colors.white)),
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
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}
