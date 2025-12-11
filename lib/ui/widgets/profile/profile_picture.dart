part of '../widgets.dart';

class ProfilePicture extends StatelessWidget {
  final String? avatar;
  final String? username;
  const ProfilePicture({super.key, this.avatar, this.username});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showProfile(context, avatar, username);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        child: avatar != null
            ? Expanded(child: Image.network(avatar!))
            : CircleAvatar(
                child: Text(username != null ? username!.substring(0, 1) : 'A'),
              ),
      ),
    );
  }
}
