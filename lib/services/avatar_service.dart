import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/functions/user_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AvatarService {
  final supabase = Supabase.instance.client;

  // Pick image from gallery
  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return null;
    return File(picked.path);
  }

  // Upload image to Supabase Storage
  Future<String?> uploadAvatar(File file) async {
    try {
      final userId = UserData().supabase.id;
      final ext = file.path.split('.').last;
      final fileName = '$userId.$ext';
      final filePath = 'avatars/$fileName';

      // Upload
      await supabase.storage
          .from('avatars')
          .upload(filePath, file, fileOptions: const FileOptions(upsert: true));

      // Get public URL
      final url = supabase.storage.from('avatars').getPublicUrl(filePath);

      return url;
    } catch (e) {
      print("Upload gagal: $e");
      return null;
    }
  }

  // Update avatar URL to users table
  Future<bool> updateAvatarUrl(String url) async {
    try {
      final userId = supabase.auth.currentUser!.id;

      await supabase
          .from('profiles')
          .update({'avatar_url': url})
          .eq('id', userId);

      return true;
    } catch (e) {
      print("Update URL gagal: $e");
      return false;
    }
  }
}
