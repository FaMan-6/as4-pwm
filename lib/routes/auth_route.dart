part of 'routes.dart';

class AuthRoute extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => LoginPage());
    r.child('/signup', child: (context) => SignupPage());
    r.child('/send_email', child: (context) => SendEmail());
  }
}
