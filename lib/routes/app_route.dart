part of 'routes.dart';

class AppRoute extends Module {
  @override
  void routes(r) {
    r.module('/', module: SplashRoute());
    r.module('/main', module: MainRoute(), guards: [AuthGuard()]);
    r.module('/auth', module: AuthRoute());
  }
}
