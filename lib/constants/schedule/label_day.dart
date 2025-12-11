import 'package:myapp/functions/parse.dart';

String? scheduleLabel(DateTime? day) {
  final today = dateToString(DateTime.now());

  if (day != null) {
    //TODAY
    if (dateToString(day) == today) {
      print('''
day: $day
today: $today
''');
      return 'Today';
    }
    //TOMORROW
    if (today == dateToString(day.add(const Duration(days: 1)))) {
      print('''
day: $day
today: $today
''');
      return 'Yesterday';
    }
    //YESTERDAY
    if (today == dateToString(day.subtract(const Duration(days: 1)))) {
      print('''
day: $day
today: $today
''');
      return 'Tomorrow';
    }
  } else {
    print('null day');
    return null;
  }
}
