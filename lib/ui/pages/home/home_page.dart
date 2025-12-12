part of 'home_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ReadContext(context).read<SchedulesCubit>().fetchSchedules();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: HomeGreetings()),
      body: Column(
        children: [
          SpacerHeight(height: 10),

          SpacerHeight(height: 5),
          CustomCalendar(
            onSelectedDate: (date) {
              setState(() {
                varSelectedDay = date;
              });
            },
            focusedDay: varFocusedDay,
            selectedDate: varSelectedDay,
          ),
          SpacerHeight(height: 5),
          ScheduleList(selecteDate: varSelectedDay),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Modular.to.pushNamed(
          '/main/add_schedule',
          forRoot: true,
          arguments: {'CATEGORY': null},
        ),
      ),
    );
  }
}
