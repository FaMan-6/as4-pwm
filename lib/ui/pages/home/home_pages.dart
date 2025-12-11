library home_pages;

import 'package:flutter/material.dart';
import 'package:myapp/constants/calendar_variable.dart';
import 'package:myapp/cubits/schedules/schedules_cubit.dart';
import 'package:myapp/functions/helper.dart';
import 'package:myapp/services/api_service.dart';
import 'package:myapp/ui/widgets/home/custom_calendar.dart';
import 'package:myapp/ui/widgets/home/greetings.dart';
import 'package:myapp/ui/widgets/home/schedule_list.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubits/auth/auth_cubit.dart';
import 'package:myapp/functions/theme_controller.dart';
import 'package:myapp/functions/user_data.dart';

import 'package:myapp/ui/widgets/widgets.dart';

part 'home_page.dart';
part 'main_page.dart';
part 'profile_page.dart';
part 'api/joke_page.dart';
