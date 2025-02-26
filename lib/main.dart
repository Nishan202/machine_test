import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/UI/home_screen.dart';
import 'package:machine_test/api_helper.dart';
import 'package:machine_test/bloc/user_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context) => UserBloc(apiHelper: ApiHelper()), child: MyApp(),));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: BlocProvider(create: (context) => UserBloc(apiHelper: ApiHelper()), child: HomeScreen(),),
      home: HomeScreen(),
    );
  }
}