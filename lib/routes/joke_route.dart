part of 'routes.dart';

class JokeRoute extends Module {
  @override
  void routes(RouteManager r) {
    // TODO: implement routes
    super.routes(r);
    r.child('/', child: (context) => const QuotePage());
  }
}
