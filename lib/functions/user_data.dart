import 'package:supabase_flutter/supabase_flutter.dart';

class UserData {
  final supabase = Supabase.instance.client.auth.currentSession!.user;

  String get userId => supabase.id;
  String get email => supabase.email!;
  String? get username => supabase.userMetadata!['username'];
}
