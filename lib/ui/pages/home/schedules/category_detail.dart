part of '../home_pages.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({super.key});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadContext(context).read<SchedulesCubit>().fetchSchedules();
  }

  @override
  Widget build(BuildContext context) {
    final argument = Modular.args.data as Map<String, dynamic>;
    final categoryData = argument['category'] as CategoryModel;
    final themeColor = ScheduleColorMapper.fromName(
      categoryData.color,
      context,
    );
    return Scaffold(
      backgroundColor: themeColor.primaryContainer,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          categoryData.name,
          style: TextStyle(
            color: themeColor.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: Icon(Icons.arrow_back, color: themeColor.onPrimaryContainer),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ReadContext(context).read<SchedulesCubit>().fetchSchedules(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryData.desc ?? 'No description',
                    style: TextStyle(color: themeColor.onPrimaryContainer),
                  ),
                  SpacerHeight(height: 15),
                  BlocBuilder<SchedulesCubit, SchedulesState>(
                    builder: (context, state) {
                      if (state is SchedulesInitial) {
                        WidgetsFlutterBinding.ensureInitialized()
                            .addPostFrameCallback((_) {
                              ReadContext(
                                context,
                              ).read<SchedulesCubit>().fetchSchedules();
                            });
                      }
                      if (state is SchedulesLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is SchedulesError) {
                        WidgetsFlutterBinding.ensureInitialized()
                            .addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                              print('Category Page error: ${state.message}');
                            });
                      }

                      if (state is SchedulesLoaded) {
                        final schedules = state.schedules
                            .where(
                              (schedule) =>
                                  schedule.category!.name == categoryData.name,
                            )
                            .toList();

                        if (schedules.isEmpty) {
                          return Center(
                            child: Text(
                              'No schedules found',
                              style: TextStyle(
                                color: themeColor.onPrimaryContainer,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: schedules.length,
                          itemBuilder: (context, index) {
                            final data = schedules[index];

                            return Column(
                              children: [
                                ScheduleCard(
                                  schedule: ScheduleModel(
                                    userId: '',
                                    title: data.title,
                                    desc: data.desc,
                                    date: data.date,
                                    startTime: data.startTime,
                                    endTime: data.endTime,
                                    category: CategoryModel(
                                      name: categoryData.name,
                                      color: categoryData.color,
                                      userId: '',
                                    ),
                                  ),
                                  theme: ScheduleColorMapper.fromName(
                                    categoryData.color,
                                    context,
                                  ),
                                ),
                                SpacerHeight(height: 10),
                              ],
                            );
                          },
                        );
                      }
                      return Center(child: Text('Unexpected state'));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor.card,
        onPressed: () {
          Modular.to.pushNamed(
            '/main/add_schedule',
            forRoot: true,
            arguments: {'CATEGORY': categoryData},
          );
        },
        child: Icon(Icons.add, color: themeColor.primary),
      ),
    );
  }
}
