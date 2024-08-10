import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_/view/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isHome;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.isHome = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isHome ? Get.width / 2.5 : double.infinity,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff006783),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: CustomText(
          text: text,
          color: Colors.white,
        ),
      ),
    );
  }
}
