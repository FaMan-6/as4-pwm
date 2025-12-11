import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/services/avatar_service.dart';

part 'avatar_state.dart';

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(AvatarInitial());

  final service = AvatarService();

  Future<void> pickAndUploadAvatar() async {
    emit(AvatarLoading());

    // 1. Pick image
    final File? image = await service.pickImage();
    if (image == null) {
      emit(AvatarError("Tidak ada gambar yang dipilih."));
      return;
    }

    // 2. Upload
    final url = await service.uploadAvatar(image);
    if (url == null) {
      emit(AvatarError("Upload gagal."));
      return;
    }

    // 3. Save URL to database
    final success = await service.updateAvatarUrl(url);
    if (!success) {
      emit(AvatarError("Gagal update URL ke database."));
      return;
    }

    emit(AvatarSuccess(url));
  }
}
