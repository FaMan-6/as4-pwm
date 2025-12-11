import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myapp/constants/theme/schedule_palette.dart';
import 'package:myapp/functions/helper.dart';
import 'package:myapp/models/category_model.dart';
import 'package:myapp/models/schedule_model.dart';

class DefaultCategoryCard extends StatefulWidget {
  final String color;
  final String title;
  final String desc;
  final CategoryModel? category;
  final ScheduleModel? schedule;
  const DefaultCategoryCard({
    super.key,
    required this.color,
    required this.title,
    required this.desc,
    this.category,
    this.schedule,
  });

  @override
  State<DefaultCategoryCard> createState() => _DefaultCategoryCardState();
}

class _DefaultCategoryCardState extends State<DefaultCategoryCard> {
  @override
  Widget build(BuildContext context) {
    final _categoryColor = ScheduleColorMapper.fromName(widget.color, context);
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed(
          '/main/category',
          forRoot: true,
          arguments: {'category': widget.category, 'schedule': widget.schedule},
        );
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: _categoryColor.primaryContainer,
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: _categoryColor.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SpacerHeight(height: 5),
            Text(
              widget.desc,
              style: TextStyle(
                color: _categoryColor.onPrimaryContainer,
                fontSize: 12,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
