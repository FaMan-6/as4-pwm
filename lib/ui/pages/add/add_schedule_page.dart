part of 'add_pages.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({super.key});

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final formKey = GlobalKey<FormState>();
  final controller = ScheduleController();
  final CategoryModel? category = Modular.args.data['CATEGORY'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (category != null) {
      controller.categoryController.text = category!.name;
      controller.selectedCategoryId = category!.id;
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (controller.titleController.text.isEmpty &&
                controller.categoryController.text.isEmpty &&
                controller.dateController.text.isEmpty &&
                controller.endTimeController.text.isEmpty &&
                controller.startTimeController.text.isEmpty) {
              Modular.to.popUntil((route) {
                return route.settings.name == '/main/schedules';
              });
              return;
            }
            final result = await showPopupWidget(
              context,
              'Are you sure you want to go back?',
              'Discard',
              'Yes',
            );
            if (result!) {
              Modular.to.popUntil((route) {
                return route.settings.name == '/main/schedules';
              });
            }
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Add Schedule'),
      ),
      body: BlocListener<SchedulesCubit, SchedulesState>(
        listener: (context, state) {
          if (state is SchedulesError) {
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            });
            print('Schedule insert error: ${state.message}');
          }

          if (state is SchedulesSuccess) {
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Schedule added')));
              Modular.to.pop(context);
            });
            print('Schedule insert success');
          }
        },
        child: BlocBuilder<SchedulesCubit, SchedulesState>(
          builder: (context, state) {
            if (state is SchedulesLoading) {
              return const Center(child: CircularProgressIndicator());
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
                      text: 'Add Schedule',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final userId = UserData().userId;
                          final title = controller.titleController.text;
                          final date = controller.dateController.text;
                          final startTime = controller.startTimeController.text;
                          final endTime = controller.endTimeController.text;
                          await ReadContext(
                            context,
                          ).read<SchedulesCubit>().addSchedule(
                            ScheduleModel(
                              userId: userId,
                              title: title,
                              date: DateTime.parse(date),
                              startTime: parseTime(startTime),
                              endTime: parseTime(endTime),
                              categoryId: 7,
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
