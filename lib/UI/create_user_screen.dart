import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/bloc/user_bloc.dart';
import 'package:machine_test/bloc/user_event.dart';
import 'package:machine_test/bloc/user_state.dart';
import 'package:machine_test/model/api_models/user_list.dart';
import 'package:machine_test/model/api_models/user_model.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Create user page"),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (_, state){
        return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'name',
                label: Text("Enter your name"),
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
                  borderSide: const BorderSide(width: 1, color: Colors.indigo),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Email',
                label: Text("Enter your email"),
                hintStyle: const TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(width: 1, color: Colors.indigo),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              final usrData = {
                'name' : nameController,
                'job' : emailController
              };
              context.read<UserBloc>().add(UserPostRequestEvent(userData: usrData));
            }, child: Text("Submit"))
          ],
        ),
      );
      })
    );
  }
}
