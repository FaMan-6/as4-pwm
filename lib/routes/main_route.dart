part of 'routes.dart';

class MainRoute extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const MainPage(),
      children: [
        ModuleRoute('/home', module: HomeRoute()),
        ModuleRoute('/profile', module: ProfileRoute()),
        ModuleRoute('/jk', module: JokeRoute()),
      ],
    );

    r.child('/add_schedule', child: (context) => const AddSchedulePage());
    r.child('/edit_schedule', child: (context) => const EditSchedulePage());
  }
}
