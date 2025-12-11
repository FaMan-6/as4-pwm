part of 'add_pages.dart';

class EditSchedulePage extends StatefulWidget {
  const EditSchedulePage({super.key});

  @override
  State<EditSchedulePage> createState() => _EditSchedulePageState();
}

class _EditSchedulePageState extends State<EditSchedulePage> {
  final controller = ScheduleController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final _arguments = Modular.args.data as Map<String, dynamic>;
    final schedule = _arguments['SCHEDULE'] as ScheduleModel?;

    if (schedule != null) {
      controller.titleController.text = schedule.title;
      controller.dateController.text = DateFormat(
        'yyyy-MM-dd',
      ).format(schedule.date).toString();
      controller.startTimeController.text = timeToString(schedule.startTime);
      controller.endTimeController.text = timeToString(schedule.endTime);
      controller.categoryController.text = schedule.category!.name;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Schedule'),
        leading: IconButton(
          onPressed: () async {
            final result = await showPopupWidget(
              context,
              'Are you sure you want to go back?',
              'Discard',
              'Yes',
            );
            if (result!) {
              Modular.to.popUntil((route) {
                return route.settings.name == '/main/home';
              });

              ReadContext(context).read<SchedulesCubit>().fetchSchedules();
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: BlocListener<SchedulesCubit, SchedulesState>(
        listener: (context, state) {
          // TODO: implement listener

          if (state is SchedulesError) {
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            });
            print('Service insert error: ${state.message}');
          }
        },
        child: BlocBuilder<SchedulesCubit, SchedulesState>(
          builder: (context, state) {
            if (state is SchedulesLoading)
              return const Center(child: CircularProgressIndicator());

            if (state is SchedulesSuccess) {
              WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((
                _,
              ) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Schedule updated successfully')),
                );
                Modular.to.pop(context);
              });
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    DefaultTextFiled(
                      hint: 'Enter the title',
                      label: 'Title',
                      controller: controller.titleController,
                    ),
                    SpacerHeight(height: 10),
                    DefaultDatePicker(controller: controller.dateController),
                    SpacerHeight(height: 10),
                    Row(
                      children: [
                        DefaultTimePicker(
                          controller: controller.startTimeController,
                          label: 'Start time',
                        ),
                        SpacerWidth(width: 10),
                        DefaultTimePicker(
                          controller: controller.endTimeController,
                          label: 'End time',
                        ),
                      ],
                    ),
                    SpacerHeight(height: 20),
                    DefaultButton(
                      text: 'Edit Schedule',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final userId = UserData().userId;
                          final title = controller.titleController.text;
                          final date = controller.dateController.text;
                          final startTime = controller.startTimeController.text;
                          final endTime = controller.endTimeController.text;

                          await ReadContext(
                            context,
                          ).read<SchedulesCubit>().updateSchedule(
                            ScheduleModel(
                              id: schedule!.id,
                              title: title,
                              date: DateFormat('yyyy-MM-dd').parse(date),
                              startTime: parseTime(startTime),
                              endTime: parseTime(endTime),
                              categoryId: 7,
                              userId: userId,
                              desc: '',
                            ),
                            context,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
