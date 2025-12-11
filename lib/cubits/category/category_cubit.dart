import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/functions/user_data.dart';
import 'package:myapp/models/category_model.dart';
import 'package:myapp/services/services.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final services = ScheduleService();
  final user = UserData();

  Future<void> fetchCategory() async {
    emit(CategoryLoading());
    try {
      final response = await services.fetchCategory(user.userId);
      print(response.asMap());
      final data = response.map((e) => CategoryModel.fromJson(e)).toList();
      print('Berhasil mengambil data');
      emit(CategoryLoaded(categories: data));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
      print('Service insert error: $e');
    }
  }

  Future<void> addCategory(CategoryModel category) async {
    emit(CategoryLoading());
    try {
      await services.addCategory(category);
      print('Berhasil memasukan data');
      emit(CategorySuccess());
    } catch (e) {
      emit(CategoryError(message: e.toString()));
      print('Cubit Category insert error: $e');
    }
  }
}
