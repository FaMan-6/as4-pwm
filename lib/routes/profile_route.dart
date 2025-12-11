part of 'routes.dart';

class ProfileRoute extends Module {
  @override
  void routes(RouteManager r) {
    // TODO: implement routes
    super.routes(r);

    r.child('/', child: (context) => const ProfilePage());
  }
}
