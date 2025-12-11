import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/constants/theme/schedule_palette.dart';
import 'package:myapp/cubits/schedules/schedules_cubit.dart';
import 'package:myapp/functions/helper.dart';
import 'package:myapp/models/category_model.dart';
import 'package:myapp/models/schedule_model.dart';
import 'package:myapp/ui/widgets/cards/schedule_card.dart';
import 'package:myapp/ui/widgets/widgets.dart';

class ScheduleListCard extends StatefulWidget {
  final ScheduleModel schedule;
  const ScheduleListCard({super.key, required this.schedule});

  @override
  State<ScheduleListCard> createState() => _ScheduleListCardState();
}

class _ScheduleListCardState extends State<ScheduleListCard>
    with TickerProviderStateMixin {
  bool _isBigCard = false;
  late final SlidableController _slidableController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _slidableController = SlidableController(this);
    _slidableController.animation.addListener(_watchFullSlide);
  }

  void _watchFullSlide() {
    // 1.0 = full slide ke kanan
    if (_slidableController.ratio >= 1.0) {
      // Aksi ketika full slide
      print("FULL SLIDE TRIGGERED!");
      // contoh aksi → buka edit
      Modular.to.pushNamed(
        '/main/edit_schedule',
        arguments: {'SCHEDULE': widget.schedule},
      );

      // Tutup slidable supaya kembali normal
      _slidableController.close();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _slidableController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.schedule;
    final themeColor = ScheduleColorMapper.fromName(
      data.category!.color,
      context,
    );
    return GestureDetector(
      onTap: () => setState(() => _isBigCard = !_isBigCard),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data.startTime.format(context),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SpacerWidth(width: 10),
          Expanded(
            child: Slidable(
              controller: _slidableController,
              key: ValueKey(data.id),
              endActionPane: ActionPane(
                dragDismissible: true,
                motion: StretchMotion(),
                dismissible: DismissiblePane(
                  onDismissed: () async {
                    final cubit = ReadContext(context).read<SchedulesCubit>();
                    final result = await showPopupWidget(
                      context,
                      'Delete Schedule',
                      'Are you sure you want to delete this schedule?',
                      'Delete',
                    );
                    if (result!) {
                      await ReadContext(
                        context,
                      ).read<SchedulesCubit>().deleteSchedule(data.id!);
                      cubit.fetchSchedules();
                    }
                    cubit.fetchSchedules();
                  },
                ),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    borderRadius: BorderRadius.circular(12),
                    spacing: 2,
                    autoClose: true,
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    label: 'Delete',
                  ),
                ],
              ),
              startActionPane: ActionPane(
                dragDismissible: true,
                extentRatio: 0.25,
                dismissible: DismissiblePane(
                  onDismissed: () => Modular.to.pushNamed(
                    '/main/edit_schedule',
                    arguments: {'SCHEDULE': data},
                    forRoot: true,
                  ),
                ),
                motion: StretchMotion(),
                children: [
                  SlidableAction(
                    flex: 1,
                    borderRadius: BorderRadius.circular(12),
                    spacing: 2,
                    autoClose: true,
                    label: 'Edit',
                    backgroundColor: themeColor.primary,
                    icon: Icons.edit,
                    onPressed: (context) {
                      Modular.to.pushNamed(
                        '/main/edit_schedule',
                        arguments: {'SCHEDULE': data},
                        forRoot: true,
                      );
                    },
                  ),
                ],
              ),
              child: ScheduleCard(
                theme: ScheduleColorMapper.fromName(
                  data.category!.color,
                  context,
                ),
                schedule: ScheduleModel(
                  userId: '',
                  title: data.title,
                  desc: data.desc,
                  date: data.date,
                  startTime: data.startTime,
                  endTime: data.endTime,
                  category: CategoryModel(
                    name: data.category!.name,
                    color: data.category!.color,
                    userId: 'userId',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
