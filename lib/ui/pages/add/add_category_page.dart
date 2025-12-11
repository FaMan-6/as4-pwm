part of 'add_pages.dart';

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _categoryController = CategoryController();
    final formKey = GlobalKey<FormState>();
    final _user = UserData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Modular.to.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Add Category'),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CategoryError) {
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              print('Category insert error: ${state.message}');
            });
          }

          if (state is CategorySuccess) {
            WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Category Added')));
            });
            Modular.to.pop(context);
            ReadContext(context).read<CategoryCubit>().fetchCategory();
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  DefaultTextFiled(
                    hint: 'Enter the title',
                    label: 'Title',
                    controller: _categoryController.titleController,
                  ),
                  SpacerHeight(height: 10),
                  DescField(controller: _categoryController.descController),
                  SpacerHeight(height: 10),
                  ColorPicker(controller: _categoryController.colorController),
                  SpacerHeight(height: 15),
                  DefaultButton(
                    text: 'Add Category',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ReadContext(context).read<CategoryCubit>().addCategory(
                          CategoryModel(
                            name: _categoryController.titleController.text,
                            desc:
                                _categoryController.descController.text.isEmpty
                                ? ''
                                : _categoryController.descController.text,
                            color: _categoryController.colorController.text,
                            userId: _user.userId,
                          ),
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
    );
  }
}
