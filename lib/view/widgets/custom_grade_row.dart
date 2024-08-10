import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_/controllers/gpa_controller.dart';
import 'package:gpa_/view/widgets/custom_text.dart';

class CustomGradeRow extends StatelessWidget {
  final int index;
  const CustomGradeRow({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GPAController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Course ${index + 1}',
                  color: Colors.black,
                ),
                const CustomText(
                  text: '3',
                  color: Colors.black,
                ),
                Obx(
                  () => DropdownButton<String>(
                    value: controller.selectedGrades[index],
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: CustomText(
                          text: value,
                          color: Colors.black,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.selectedGrades[index] = newValue;
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<String> items = ["--", "A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"];
