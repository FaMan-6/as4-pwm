part of '../home_pages.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadContext(context).read<CategoryCubit>().fetchCategory();
  }

  final user = UserData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SpacerHeight(height: 10),
            Row(
              children: [
                Expanded(
                  child: AddCategoryCard(
                    onTap: () {
                      showBottomSchedule(context);
                    },
                  ),
                ),
                SpacerWidth(width: 16),
                Expanded(
                  child: DefaultCategoryCard(
                    color: 'blue',
                    desc: 'This is a general category',
                    title: 'General',
                    category: CategoryModel(
                      color: 'blue',
                      name: 'General',
                      userId: user.userId,
                      desc: 'This is a general category',
                      id: 7,
                    ),
                  ),
                ),
              ],
            ),
            SpacerHeight(height: 16),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is CategoryError) {
                  WidgetsFlutterBinding.ensureInitialized()
                      .addPostFrameCallback((_) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                        print('Category insert error: ${state.message}');
                      });
                }

                if (state is CategoryLoaded) {
                  final data = state.categories;

                  if (data.isEmpty) {
                    return Center();
                  }

                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  mainAxisExtent: 150,
                                ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final category = data[index];
                              return DefaultCategoryCard(
                                color: category.color,
                                desc: category.desc ?? '',
                                title: category.name,
                                category: category,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Center(child: Text('unexpected state'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
