import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_/controllers/gpa_controller.dart';
import 'package:gpa_/view/widgets/custom_button.dart';
import 'package:gpa_/view/widgets/custom_grade_row.dart';
import 'package:gpa_/view/widgets/custom_text.dart';

class SemesterGpaScreen extends StatelessWidget {
  const SemesterGpaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GPAController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Semester GPA',
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/university-background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: Get.width > 800 ? Get.width / 3 : Get.width / 1.1,
            height: GetPlatform.isWeb ? Get.height / 1 : Get.height / 1.4,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < controller.selectedGrades.length; i++)
                      CustomGradeRow(index: i),
                    const SizedBox(height: 10),
                    if (controller.isSemsShow.value)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: controller.gpa.value.toStringAsFixed(2),
                              color: controller.getColor(controller.gpa.value),
                            ),
                            const SizedBox(
                              height: 55,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            CustomText(
                              text: controller.gpak(controller.gpa.value),
                              color: controller.getColor(controller.gpa.value),
                            ),
                            const SizedBox(
                              height: 55,
                              child: VerticalDivider(
                                color: Colors.black,
                              ),
                            ),
                            CustomText(
                              text: '${controller.hours.value} hours',
                              color: controller.getColor(controller.gpa.value),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Calculate',
                      onTap: () {
                        controller.calculateGPA();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
