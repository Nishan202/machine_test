import 'package:flutter/material.dart';
import 'package:machine_test/model/api_models/user_list.dart';

class UserDetailsScreen extends StatefulWidget {
  final UserList user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  // final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details page"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, backgroundImage: NetworkImage(widget.user.avatar!),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name : ${widget.user.first_name}"),
                SizedBox(width: 5,),
                Text(widget.user.last_name!)
              ],
            ),
            SizedBox(height: 5,),
            Text("Email id : ${widget.user.email}"),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: Text("Update profile"))
          ],
        ),
      ),
    );
  }
}