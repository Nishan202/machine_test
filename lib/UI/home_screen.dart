
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/UI/create_user_screen.dart';
import 'package:machine_test/UI/user_details_screen.dart';
import 'package:machine_test/bloc/user_bloc.dart';
import 'package:machine_test/bloc/user_event.dart';
import 'package:machine_test/bloc/user_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<UserBloc>(context).add(UserGetRequestEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      drawer: Drawer(
        width: 300,
        elevation: 11,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(onPressed: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateUserScreen())), child: Text("Create user")),
            ),
          ],
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (_, state){
        if(state is UserLoadingState){
          return const Center(child: CircularProgressIndicator(),);
        } else if(state is UserErrorState){
          return Center(child: Text(state.erroMessage),);
        } else if(state is UserLoadedState) {
            var userDataModel = state.responseData;
            return userDataModel.data!.isNotEmpty ? ListView.builder(itemCount: userDataModel.data!.length, itemBuilder: (ctx, index) {
              return Card(
                child: InkWell(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsScreen())),
                  child: ListTile(
                    leading: CircleAvatar(child: Image.network(userDataModel.data![index].avatar!),),
                    title: Row(children: [Text(userDataModel.data![index].first_name!, style: TextStyle(color: Colors.black),), SizedBox(width: 10,), Text(userDataModel.data![index].last_name!, style: TextStyle(color: Colors.black),)],),
                    subtitle: Text(userDataModel.data![index].email!, style: TextStyle(color: Colors.black),),
                  ),
                ),
              );
            }) : Center(child: Text("No data!!"),);
          }
        return Container();
      })
    );
  }
}