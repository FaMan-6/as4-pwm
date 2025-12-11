import 'package:flutter/material.dart';
import 'package:myapp/functions/helper.dart';

class BigScheduleCard extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final String? category;
  final String startTime;
  final String endTime;
  const BigScheduleCard({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.title,
    this.category,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: const Color.fromARGB(20, 0, 0, 0)),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(50, 0, 0, 0),
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium!.copyWith(color: textColor),
                ),
              ),
              SpacerHeight(height: 5),
              Text(
                '$startTime - $endTime',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall!.copyWith(color: textColor),
              ),
            ],
          ),
          // Text(
          //   category,
          //   style: Theme.of(
          //     context,
          //   ).textTheme.titleSmall!.copyWith(color: textColor),
          // ),
        ],
      ),
    );
  }
}
