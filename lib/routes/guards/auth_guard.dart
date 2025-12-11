import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// AuthGuard adalah sebuah RouteGuard yang berfungsi untuk melindungi rute-rute tertentu.
// Hanya pengguna yang sudah login yang dapat mengakses rute yang dijaga oleh guard ini.
class AuthGuard extends RouteGuard {
  // Jika pengguna belum login (canActivate mengembalikan false),
  // mereka akan diarahkan ke halaman '/auth/'.
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  // Metode canActivate akan dipanggil setiap kali pengguna mencoba mengakses rute yang dijaga.
  // Metode ini akan mengembalikan true jika pengguna diizinkan mengakses, dan false jika tidak.
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    // Mengecek status otentikasi pengguna menggunakan Supabase.
    // Supabase.instance.client.auth.currentUser akan bernilai null jika tidak ada pengguna yang login.
    if (Supabase.instance.client.auth.currentSession != null) {
      // Jika ada pengguna yang sedang login, kembalikan true.
      // Ini berarti pengguna diizinkan untuk melanjutkan ke rute yang dituju.
      return true;
    } else {
      // Jika tidak ada pengguna yang login, kembalikan false.
      // Ini akan mencegah pengguna mengakses rute dan mengarahkan mereka
      // ke halaman login sesuai dengan parameter 'redirectTo' di atas.
      return false;
    }
  }
}
