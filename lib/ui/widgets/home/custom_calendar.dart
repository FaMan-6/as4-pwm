import 'package:flutter/material.dart';
import 'package:myapp/constants/calendar_variable.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final Function(DateTime) onSelectedDate;
  final DateTime? selectedDate;
  final DateTime? focusedDay;
  const CustomCalendar({
    super.key,
    required this.onSelectedDate,
    this.selectedDate,
    this.focusedDay,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      varFocusedDay = widget.focusedDay ?? today;
      varSelectedDay = widget.selectedDate ?? today;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSelectedDate(varSelectedDay!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TableCalendar(
        focusedDay: varFocusedDay!,
        firstDay: firstDay,
        lastDay: lastDay,
        currentDay: today,
        selectedDayPredicate: (day) => isSameDay(day, varSelectedDay),
        rowHeight: 35,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          formatButtonShowsNext: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
          titleTextStyle: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
        ),
        calendarFormat: CalendarFormat.week,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
          weekendStyle: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
          holidayTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
          disabledTextStyle: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
          weekendTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
          outsideTextStyle: TextStyle(
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
          canMarkersOverflow: true,
          todayTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          todayDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),

        onDaySelected: (selectedDay, focusedDay) {
          widget.onSelectedDate(selectedDay);
          setState(() {
            varFocusedDay = focusedDay;
            varSelectedDay = selectedDay;
          });
        },

        calendarBuilders: CalendarBuilders(
          headerTitleBuilder: (context, day) {
            // custom tampilan header
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight, // 👈 judul ke kanan
                child: Text(
                  '${getMonthName(day.month)} ${day.year}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
