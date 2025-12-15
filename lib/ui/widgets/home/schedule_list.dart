import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/constants/schedule/label_day.dart';
import 'package:myapp/cubits/schedules/schedules_cubit.dart';
import 'package:myapp/functions/helper.dart';
import 'package:myapp/functions/parse.dart';
import 'package:myapp/ui/widgets/cards/schedule_list_card.dart';

class ScheduleList extends StatefulWidget {
  final DateTime? selecteDate;
  const ScheduleList({super.key, this.selecteDate});

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  void initState() {
    super.initState();
    print('menjalankan init state');
    label = scheduleLabel(widget.selecteDate);
    context.read<SchedulesCubit>().fetchSchedules();
  }

  String? label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: ColorScheme.of(context).primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpacerHeight(height: 10),
            Text(
              scheduleLabel(widget.selecteDate) ??
                  labelFromDate(widget.selecteDate),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SpacerHeight(height: 15),
            Expanded(
              child: BlocBuilder<SchedulesCubit, SchedulesState>(
                builder: (context, state) {
                  if (state is SchedulesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SchedulesError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is SchedulesSuccess) {
                    WidgetsFlutterBinding.ensureInitialized()
                        .addPostFrameCallback((_) {
                          context.read<SchedulesCubit>().fetchSchedules();
                        });
                  }

                  if (state is SchedulesLoaded) {
                    final _schedules =
                        state.schedules
                            .where(
                              (schedule) =>
                                  dateToString(schedule.date) ==
                                  dateToString(widget.selecteDate),
                            )
                            .toList()
                          ..sort(
                            (s1, s2) => s1.startTime.compareTo(s2.startTime),
                          );

                    //                     print('''
                    // ${state.schedules.last.date}
                    // ${dateToString(widget.selecteDate ?? DateTime.now())}
                    // $_schedules
                    // ''');
                    if (_schedules.isEmpty) {
                      return Center(
                        child: SvgPicture.asset(
                          'assets/images/No data-rafiki.svg',

                          height: 250,
                        ),
                      );
                    }

                    return ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _schedules.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ScheduleListCard(schedule: _schedules[index]),
                            SpacerHeight(height: 10),
                          ],
                        );
                      },
                    );
                  }
                  return Center(child: Text('unexpcted state'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
