final DateTime firstDay = DateTime(1000);

DateTime today = DateTime.now();
DateTime lastDay = today.add(Duration(days: 365));
DateTime? varFocusedDay;
DateTime? varSelectedDay;

String getMonthName(int month) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return months[month - 1];
}
