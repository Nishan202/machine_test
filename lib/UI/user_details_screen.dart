import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/bloc/user_bloc.dart';
import 'package:machine_test/bloc/user_state.dart';
import 'package:machine_test/model/api_models/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Details page"),),
      body: BlocBuilder<UserBloc, UserState>(builder: (ctx, state){
        if(state is UserLoadingState){
          return Center(child: CircularProgressIndicator(),);
        } else if(state is UserErrorState){
          return Center(child: Text(state.erroMessage),);
        } else if(state is UserLoadedState){
          var userDataModel = state.responseData;
          return userDataModel.data!.isNotEmpty ? ListView.builder(
            itemCount: userDataModel.data!.length,
            itemBuilder: (ctx, index) {
              return Column(children: [
                CircleAvatar(child: Image.network(userDataModel.data![index].avatar!),)
              ],);
            }
          ) : Center(child: Text("No data"),);
        }
        return Container();
      })
    );
  }
}