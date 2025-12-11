import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/cubits/avatar/avatar_cubit.dart';

void showProfile(BuildContext context, String? avatar, String? username) {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
        children: [
          Container(
            height: 200,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentGeometry.center,
                  child: avatar != null
                      ? Container(
                          child: Image.network(avatar, fit: BoxFit.cover),
                        )
                      : Text(
                          username!.substring(0, 1),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                ),
                Align(
                  alignment: AlignmentGeometry.bottomLeft,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 10),
                    color: const Color.fromARGB(169, 0, 0, 0),
                    child: IconButton(
                      onPressed: () async {
                        context.read<AvatarCubit>().pickAndUploadAvatar();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
