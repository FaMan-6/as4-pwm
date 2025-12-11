part of 'avatar_cubit.dart';

@immutable
sealed class AvatarState {}

final class AvatarInitial extends AvatarState {}

class AvatarLoading extends AvatarState {}

class AvatarSuccess extends AvatarState {
  final String url;
  AvatarSuccess(this.url);
}

class AvatarError extends AvatarState {
  final String message;
  AvatarError(this.message);
}
