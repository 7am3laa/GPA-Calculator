import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_/view/screens/semestergpa_screen.dart';
import 'package:gpa_/view/screens/totalgpa_screen.dart';
import 'package:gpa_/view/widgets/custom_button.dart';
import 'package:gpa_/view/widgets/custom_text.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/university-background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fci_en.png',
                    width: context.width / 2.5,
                  ),
                  const SizedBox(width: 20),
                  Image.asset(
                    'assets/images/uni_en.png',
                    width: context.width / 2.5,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CustomText(
                text: 'Welcome To GPA Calculator    ',
                color: Colors.black,
              ),
              const CustomText(
                text: 'choose to start calculating your GPA',
                color: Colors.black,
                fontSize: 18,
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      isHome: true,
                      text: 'SEMESTER GPA',
                      onTap: () {
                        Get.to(() => const SemesterGpaScreen());
                      },
                    ),
                    CustomButton(
                      isHome: true,
                      text: 'TOTAL GPA',
                      onTap: () {
                        Get.to(() => const TotalGpaScreen());
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
