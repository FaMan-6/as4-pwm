part of 'schedules_cubit.dart';

@immutable
sealed class SchedulesState {}

final class SchedulesInitial extends SchedulesState {}

final class SchedulesLoading extends SchedulesState {}

final class SchedulesSuccess extends SchedulesState {}

final class SchedulesLoaded extends SchedulesState {
  final List<ScheduleModel> schedules;

  SchedulesLoaded({required this.schedules});
}

final class SchedulesError extends SchedulesState {
  final String message;

  SchedulesError({required this.message});
}
