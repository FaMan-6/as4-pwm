part of 'services.dart';

class ScheduleService {
  final supabase = Supabase.instance.client.schema('todo');

  Future<List<Map<String, dynamic>>> fetchSchedule(String userId) async {
    try {
      final response = await supabase
          .from('schedules')
          .select('*, category(*)')
          .eq('user_id', userId);
      return response;
    } catch (e) {
      print('Service fetch error: $e');
      return [];
    }
  }

  Future<void> addSchedule(ScheduleModel schedule, BuildContext context) async {
    print('''
Data yang dimasukkan:
${schedule.toJson(context)}
''');
    try {
      await supabase.from('schedules').insert(schedule.toJson(context));
      print('Berhasil memasukan data');
    } catch (e) {
      print('Service insert error: $e');
    }
  }

  Future<void> deleteSchedule(int id) async {
    try {
      await supabase.from('schedules').delete().eq('id', id);
      print('Berhasil menghapus data');
    } catch (e) {
      print('Service delete error: $e');
    }
  }

  Future<void> updateSchedule(
    ScheduleModel schedule,
    BuildContext context,
  ) async {
    try {
      await supabase
          .from('schedules')
          .update(schedule.toJson(context))
          .eq('id', schedule.id!);
      print('Berhasil memperbarui data');
    } catch (e) {
      print('Service update error: $e');
    }
  }

  Future<List<Map<String, dynamic>>> fetchCategory(String userId) async {
    try {
      final response = await supabase
          .from('category')
          .select()
          .eq('user_id', userId);
      return response;
    } catch (e) {
      print('Service fetch error: $e');
      return [];
    }
  }

  Future<void> addCategory(CategoryModel category) async {
    print('''
Data yang dimasukkan:
${category.toJson()}
''');
    try {
      await supabase.from('category').insert(category.toJson());
      print('Berhasil memasukan data');
    } catch (e) {
      print('Service insert error: $e');
    }
  }
}
