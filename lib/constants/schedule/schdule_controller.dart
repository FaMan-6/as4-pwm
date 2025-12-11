import 'package:flutter/widgets.dart';

class ScheduleController {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  int? selectedCategoryId;
}
