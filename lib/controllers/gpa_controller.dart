// ignore_for_file: deprecated_member_use



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GPAController extends GetxController  {
  RxDouble gpa = 0.0.obs;
  RxString name = ''.obs;
  RxInt hours = 0.obs;
  RxList<String> selectedGrades = List.filled(6, '--').obs;
  RxDouble result = 0.0.obs;
  RxBool isTotalShow = false.obs;
  RxBool isSemsShow = false.obs;

  

  void calculateGPA() {
    isSemsShow.value = true;
    double totalPoints = 0;
    int totalCourses = 0;
    hours.value = 0;

    for (String grade in selectedGrades) {
      if (grade != '--') {
        totalPoints += _gradeToPoints(grade);
        totalCourses++;
        hours.value += _gradeHours(grade);
      }
    }

    gpa.value = totalCourses > 0 ? totalPoints / totalCourses : 0.0;
  }

  void calculateSum(n1, n2, n3) {
    isTotalShow.value = true;
    try {
      double num1 = double.parse(n1);
      double num2 = double.parse(n2);
      double num3 = double.parse(n3);

      if (num3 > 0) {
        double sum = (((num1 * (num3 - 1)) + num2)) / num3;
        result.value = sum;
      } else {
        result.value = 0.0;
      }
    } catch (e) {
      result.value = 0.0;
    }
  }

  int _gradeHours(String grade) {
    switch (grade) {
      case 'A+':
      case 'A':
      case 'B+':
      case 'B':
      case 'C+':
      case 'C':
      case 'D+':
      case 'D':
        return 3;
      case 'F':
        return 0;
      default:
        return 0;
    }
  }

  double _gradeToPoints(String grade) {
    switch (grade) {
      case 'A+':
        return 4.0;
      case 'A':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.7;
      case 'C':
        return 2.4;
      case 'D+':
        return 2.2;
      case 'D':
        return 2.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }

  String gpak(double g) {
    if (g >= 3.5) {
      return 'ممتاز';
    } else if (g >= 3.0 && g < 3.5) {
      return 'جيد جدا';
    } else if (g >= 2.5 && g < 3.0) {
      return 'جيد';
    } else if (g >= 2.0 && g < 2.5) {
      return 'مقبول';
    } else if (g >= 1.5 && g < 2.0) {
      return 'ضعيف';
    } else if (g < 1.5) {
      return 'ضعيف جدا';
    }
    return '';
  }

  Color getColor(double g) {
    if (g >= 3.5) {
      return Colors.green;
    } else if (g >= 3.0 && g < 3.5) {
      return Colors.orange.shade500;
    } else if (g >= 2.5 && g < 3.0) {
      return Colors.orange.shade700;
    } else if (g >= 2.0 && g < 2.5) {
      return Colors.orange.shade900;
    } else if (g >= 1.5 && g < 2.0) {
      return Colors.red;
    } else if (g < 1.5) {
      return Colors.red;
    }
    return Colors.black;
  }
}
