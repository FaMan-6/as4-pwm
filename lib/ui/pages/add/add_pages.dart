library add_pages;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:myapp/constants/schedule/schdule_controller.dart';
import 'package:myapp/cubits/schedules/schedules_cubit.dart';
import 'package:myapp/functions/helper.dart';
import 'package:myapp/functions/parse.dart';
import 'package:myapp/functions/user_data.dart';
import 'package:myapp/models/category_model.dart';
import 'package:myapp/models/schedule_model.dart';
import 'package:myapp/constants/schedule/category_controller.dart';
import 'package:myapp/cubits/category/category_cubit.dart';
import 'package:myapp/ui/widgets/widgets.dart';

part 'add_category_page.dart';
part 'add_schedule_page.dart';
part 'edit_schedule_page.dart';
