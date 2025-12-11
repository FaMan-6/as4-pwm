part of 'services.dart';

class AuthService {
  final supabase = Supabase.instance.client.auth;

  Future<AuthResponse> singupService(
    String password,
    String email,
    String username,
  ) async {
    try {
      final response = await supabase.signUp(
        password: password,
        email: email,
        data: {'username': username},
      );

      print('Login with email $email successed');
      return response;
    } on AuthApiException catch (e) {
      print('Service AuthApiException signup: ${e.message}');
      rethrow;
    } catch (e) {
      print('Service error signup: $e');
      rethrow;
    }
  }

  Future<AuthResponse> loginService(String password, String email) async {
    try {
      final response = await supabase.signInWithPassword(
        password: password,
        email: email,
      );
      print('Login with email $email successed');
      return response;
    } on AuthApiException catch (e) {
      print('Service AuthApiException login: ${e.message}');
      rethrow;
    } catch (e) {
      print('Service error login: $e');
      rethrow;
    }
  }

  Future<void> logoutService() async {
    try {
      await supabase.signOut();
      print('Logout successed');
    } on AuthApiException catch (e) {
      print('Service AuthApiException logout: ${e.message}');
      rethrow;
    } catch (e) {
      print('Service error logout: $e');
      rethrow;
    }
  }
}
