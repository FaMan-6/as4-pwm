import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final service = AuthService();

  Future<void> signUp(
    String confirmPassword,
    String password,
    String email,
    String username,
  ) async {
    emit(AuthLoading());
    if (password != confirmPassword) {
      emit(AuthError(message: 'Passwords do not match'));
      return;
    }
    try {
      final response = await service.singupService(password, email, username);

      final user = response.user;

      emit(AuthSuccess(user: user!));
    } on AuthApiException catch (e) {
      print('AuthApiException signUp: ${e.message}');
      emit(AuthError(message: e.message));
    } catch (e) {
      print('Auth cubit signUp Exception: $e');
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signIn(String password, String email) async {
    emit(AuthLoading());
    try {
      final response = await service.loginService(password, email);
      final user = response.user;
      emit(AuthSuccess(user: user!));
    } on AuthApiException catch (e) {
      print('AuthApiException signIn: ${e.message}');
      emit(AuthError(message: e.message));
    } catch (e) {
      print('Auth cubit signIn Exception: $e');
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await service.logoutService();
      emit(AuthLogout());
    } on AuthApiException catch (e) {
      print('AuthApiException logout: ${e.message}');
      emit(AuthError(message: e.message));
    } catch (e) {
      print('Auth cubit logout Exception: $e');
      emit(AuthError(message: e.toString()));
    }
  }
}
