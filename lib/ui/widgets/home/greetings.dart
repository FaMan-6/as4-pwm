import 'package:flutter/material.dart';
import 'package:myapp/functions/greetings_function.dart';
import 'package:myapp/functions/user_data.dart';

class HomeGreetings extends StatefulWidget {
  const HomeGreetings({super.key});

  @override
  State<HomeGreetings> createState() => _HomeGreetingsState();
}

class _HomeGreetingsState extends State<HomeGreetings> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    label = greetingsLabel();
  }

  String? label;
  final userData = UserData();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? 'Hello',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            userData.username ?? 'User',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
