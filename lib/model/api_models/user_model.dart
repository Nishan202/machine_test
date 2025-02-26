import 'package:machine_test/model/api_models/user_list.dart';

class UserModel {

  List<UserList>? data;

  UserModel({required this.data});

  factory UserModel.fromJson(Map<String, dynamic> json){
    List<UserList> listUsers = [];

    for(Map<String, dynamic> eachUsers in json['data']){
      UserList mUsers = UserList.fromJson(eachUsers);
      listUsers.add(mUsers);
    }
    return UserModel(data: listUsers);
  }
}