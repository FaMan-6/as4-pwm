import 'package:flutter/material.dart';
import 'package:myapp/functions/parse.dart';
import 'package:myapp/models/category_model.dart';

class ScheduleModel {
  final int? id;
  final String userId;
  final String title;
  final String desc;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final CategoryModel? category;
  final int? categoryId;

  ScheduleModel({
    this.id,
    required this.userId,
    required this.title,
    required this.desc,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.category,
    this.categoryId,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      desc: json['desc'],
      date: DateTime.parse(json['date']),
      startTime: parseTime(json['start_time']),
      endTime: parseTime(json['end_time']),
      category: CategoryModel.fromJson(json['category']),
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson(BuildContext context) {
    print(startTime.toString());
    print(endTime.toString());
    return {
      'user_id': userId,
      'title': title,
      'desc': desc,
      'date': date.toIso8601String(),
      'start_time': startTime.format(context),
      'end_time': endTime.format(context),
      'category': categoryId,
    };
  }
}
