import 'package:flutter/widgets.dart';
import 'package:myapp/constants/theme/schedule_palette.dart';
import 'package:myapp/functions/parse.dart';
import 'package:myapp/models/schedule_model.dart';
import 'package:myapp/ui/widgets/cards/big_schedule_card.dart';
import 'package:myapp/ui/widgets/cards/small_schedule_card.dart';

class ScheduleCard extends StatefulWidget {
  final ScheduleColorSet theme;
  final ScheduleModel schedule;
  const ScheduleCard({super.key, required this.theme, required this.schedule});

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  bool _isBigCard = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isBigCard = !_isBigCard),
      child: Row(
        children: [
          Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: _isBigCard
                  ? BigScheduleCard(
                      backgroundColor: widget.theme.card,
                      category: widget.schedule.category!.name,
                      endTime: timeToString(widget.schedule.endTime),
                      startTime: timeToString(widget.schedule.startTime),
                      title: widget.schedule.title,
                      textColor: widget.theme.onCard,
                    )
                  : SmallScheduleCard(
                      backgroundColor: widget.theme.card,
                      textColor: widget.theme.onCard,
                      category: widget.schedule.category!.name,
                      title: widget.schedule.title,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
