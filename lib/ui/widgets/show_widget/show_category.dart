part of '../widgets.dart';

Future<Map<String, dynamic>?> showCategoryPicker(BuildContext context) {
  return showDialog<Map<String, dynamic>>(
    context: context,
    fullscreenDialog: false,
    builder: (context) {
      ReadContext(context).read<CategoryCubit>().fetchCategory();
      return SimpleDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text('Select a category'),
        contentPadding: const EdgeInsets.symmetric(horizontal: 23),
        children: [
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is CategoryError) {
                return Center(child: Text(state.message));
              }

              if (state is CategoryLoaded) {
                if (state.categories.isEmpty) {
                  return Center(child: Text('No categories found'));
                }
                state.categories.add(
                  CategoryModel(
                    name: 'General',
                    color: 'blue',
                    userId: UserData().userId,
                  ),
                );
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    if (state.categories.isEmpty) {
                      return Center(child: Text('No categories found'));
                    }
                    return GestureDetector(
                      onTap: () {
                        print('Tombol ditekan');
                        Modular.to.pop({
                          'id': state.categories[index].id,
                          'name': state.categories[index].name,
                          'message':
                              'Category ${state.categories[index].name} selected',
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.categories[index].name),
                          SpacerHeight(height: 2),
                          Devider(height: 2),
                          SpacerHeight(height: 2),
                        ],
                      ),
                    );
                  },
                );
              }

              return Container();
            },
          ),
          SpacerHeight(height: 23),
        ],
      );
    },
  );
}
