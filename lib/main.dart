// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc_selector/bloc/user_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: BlocSelector<UserBloc, UserState, String>(
              selector: (state) => state.user.name,
              builder: (context, name) {
                print("refresh title");
                return Text("Welcome $name");
              })),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                print("refresh body");
                return Column(
                  children: [
                    Text("Nama: ${state.user.name}"),
                    Text("Umur: ${state.user.age}"),
                    Text("Email: ${state.user.email}"),
                  ],
                );
              }),
              SizedBox(
                height: 40,
              ),
              Container(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      fillColor: Colors.blue[100],
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                onPressed: () {
                  context
                      .read<UserBloc>()
                      .add(ChangeNameEvent(controller.text));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    "Change Name",
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                onPressed: () {
                  context
                      .read<UserBloc>()
                      .add(ChangeBirthdayEvent(controller.text));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    "Change Birthday",
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                onPressed: () {
                  context
                      .read<UserBloc>()
                      .add(ChangeEmailEvent(controller.text));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text(
                    "Change Email",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
