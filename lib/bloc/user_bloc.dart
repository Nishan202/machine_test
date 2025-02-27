import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test/api_helper.dart';
import 'package:machine_test/app_exceptions.dart';
import 'package:machine_test/bloc/user_event.dart';
import 'package:machine_test/bloc/user_state.dart';
import 'package:machine_test/model/api_models/user_model.dart';
import 'package:machine_test/urls.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  ApiHelper apiHelper;

  UserBloc({required this.apiHelper}) : super(UserInitialState()){
    on<UserGetRequestEvent>((event, emit) async{
      emit(UserLoadingState());

      try {
        var responseJson = await apiHelper.getApi(url: Urls.userList2Url);
        if (responseJson != null) {
          var responseData = UserModel.fromJson(responseJson);
          emit(UserLoadedState(responseData: responseData));
        } else {
          emit(UserErrorState(erroMessage: 'Error Occured'));
        }
      } catch (e) {
        emit(UserErrorState(erroMessage: (e as AppExceptions).toErrorMessage()));
      }

    });

    on<UserPostRequestEvent>((event, emit) async{
      emit(UserLoadingState());

      try {
        var responseJson = await apiHelper.postApi(url: Urls.userPostLinkUrl);
        // print(responseJson);
        if (responseJson != null) {
          var responseData = UserModel.fromJson(responseJson);
          print(responseData);
          emit(UserLoadedState(responseData: responseData));
        } else {
          emit(UserErrorState(erroMessage: 'Error Occured'));
        }
      } catch (e) {
        emit(UserErrorState(erroMessage: (e as AppExceptions).toErrorMessage()));
      }

    });
  }
}