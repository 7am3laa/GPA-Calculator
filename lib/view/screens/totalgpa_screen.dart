// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_/controllers/gpa_controller.dart';
import 'package:gpa_/view/widgets/custom_button.dart';
import 'package:gpa_/view/widgets/custom_text.dart';
import 'package:gpa_/view/widgets/custom_textfield.dart';

class TotalGpaScreen extends StatelessWidget {
  const TotalGpaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GPAController controller = Get.put(GPAController());
    final TextEditingController oldController = TextEditingController();
    final TextEditingController newController = TextEditingController();
    final TextEditingController totalSemesterController =
        TextEditingController();

    newController.text = controller.gpa.value.toStringAsFixed(2);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Total GPA',
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/university-background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SizedBox(
              width: Get.width > 800 ? Get.width / 3 : Get.width / 1.1,
              height: GetPlatform.isWeb ? Get.height / 1.2 : Get.height / 1.4,
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: 'Old Total GPA',
                      fontSize: 19,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Old GPA',
                      controller: oldController,
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: 'GPA of this Semester',
                      fontSize: 19,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: newController.text == '0.00'
                          ? 'New GPA'
                          : newController.text,
                      controller: newController,
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      text: 'Total Number of Semesters',
                      fontSize: 19,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Total Number of Semesters',
                      controller: totalSemesterController,
                    ),
                    const SizedBox(height: 20),
                    if (controller.isTotalShow.value)
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomText(
                              text: controller.result.value.toStringAsFixed(2),
                              fontSize: 19,
                              color:
                                  controller.getColor(controller.result.value),
                            ),
                            const VerticalDivider(color: Colors.black),
                            CustomText(
                              text: controller.gpak(controller.result.value),
                              fontSize: 19,
                              color:
                                  controller.getColor(controller.result.value),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Calculate',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print("Validation passed");
                          controller.calculateSum(
                            oldController.text,
                            newController.text,
                            totalSemesterController.text,
                          );
                        } else {
                          print("Validation failed");
                        }
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
