import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:myapp/models/schedule_model.dart';
import 'package:myapp/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'schedules_state.dart';

class SchedulesCubit extends Cubit<SchedulesState> {
  SchedulesCubit() : super(SchedulesInitial());

  final services = ScheduleService();
  final user = Supabase.instance.client.auth.currentUser;

  Future<void> fetchSchedules() async {
    emit(SchedulesLoading());
    try {
      final response = await services.fetchSchedule(user!.id);
      print('''
      Berhasil mengambil data:
      ${response}''');
      final data = response.map((e) => ScheduleModel.fromJson(e)).toList();
      emit(SchedulesLoaded(schedules: data));
    } catch (e) {
      emit(SchedulesError(message: e.toString()));
      print('Cubit fetch error: $e');
    }
  }

  Future<void> addSchedule(ScheduleModel schedule, BuildContext context) async {
    emit(SchedulesLoading());
    try {
      await services.addSchedule(schedule, context);
      // print('''Berhasil memasukan data:
      // title: ${schedule.title}
      // desc: ${schedule.desc}
      // date: ${schedule.date}
      // start_time: ${schedule.startTime}
      // end_time: ${schedule.endTime}
      // category: ${schedule.category!.name}''');
      emit(SchedulesSuccess());
    } catch (e) {
      emit(SchedulesError(message: e.toString()));
      print('Cubit insert error: $e');
    }
  }

  Future<void> updateSchedule(
    ScheduleModel schedule,

    BuildContext context,
  ) async {
    emit(SchedulesLoading());
    try {
      await services.updateSchedule(schedule, context);
      emit(SchedulesSuccess());
    } catch (e) {
      emit(SchedulesError(message: e.toString()));
      print('Cubit update error: $e');
    }
  }

  Future<void> deleteSchedule(int id) async {
    emit(SchedulesLoading());
    try {
      await services.deleteSchedule(id);
      emit(SchedulesSuccess());
    } catch (e) {
      emit(SchedulesError(message: e.toString()));
      print('Cubit delete error: $e');
    }
  }
}
