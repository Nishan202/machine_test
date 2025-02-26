import 'package:machine_test/model/api_models/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState{}
class UserLoadingState extends UserState{}
class UserLoadedState extends UserState{
  UserModel responseData;
  UserLoadedState({required this.responseData});
}
class UserErrorState extends UserState{
  String erroMessage;
  UserErrorState({required this.erroMessage});
}