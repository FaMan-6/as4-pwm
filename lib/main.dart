import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/constants/theme/theme.dart';
import 'package:myapp/cubits/avatar/avatar_cubit.dart';
import 'package:myapp/cubits/schedules/schedules_cubit.dart';
import 'package:myapp/functions/theme_controller.dart';
import 'package:myapp/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:myapp/cubits/auth/auth_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Current directory: \${Directory.current.path}');
  await dotenv.load(fileName: "assets/.env");
  await Supabase.initialize(
    anonKey: dotenv.get('SUPABASE_KEY'),
    url: dotenv.get('SUPABASE_URL'),
  );
  runApp(ModularApp(module: AppRoute(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(ThemeData.light().textTheme);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SchedulesCubit()),
        BlocProvider(create: (context) => AvatarCubit()),
      ],
      child: ValueListenableBuilder(
        valueListenable: themeController.themeModeNotifier,
        builder: (context, value, child) {
          return MaterialApp.router(
            title: 'My App',
            // routerConfig: Modular.routerConfig,
            scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
            darkTheme: materialTheme.dark(),
            theme: materialTheme.light(),
            themeMode: value,
            debugShowCheckedModeBanner: false,
            routerDelegate: Modular.routerDelegate,
            routeInformationParser: Modular.routeInformationParser,
          );
        },
      ),
    );
  }
}
