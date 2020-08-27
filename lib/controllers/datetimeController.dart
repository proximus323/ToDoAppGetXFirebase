import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/models/todo.dart';

class DateTimeController extends GetxController {
  Rx<DateTime> currentDate;

  @override
  void onInit() {
    currentDate = DateTime.now().obs;
  }

  String getCurrentDay() {
    return DateFormat('EEEE').format(currentDate.value).toLowerCase();
  }

  String getCurrentData() {
    return DateFormat("d.M.y").format(currentDate.value);
  }

  changeDate(bool back) {
    if (back) {
      currentDate.value = currentDate.value.add(new Duration(days: 1));
    } else {
      currentDate.value = currentDate.value.add(new Duration(days: -1));
    }
    update();
  }
}
