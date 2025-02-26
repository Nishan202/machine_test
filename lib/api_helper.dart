import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:machine_test/app_exceptions.dart';
import 'package:machine_test/model/api_models/user_model.dart';

class ApiHelper {
  Future<dynamic> getApi({required String url}) async {
    var uri = Uri.parse(url);
    try{
      http.Response response = await http.get(uri);
      // print(response);
      return returnJsonResponse(response);
    } on SocketException catch(e){
      throw(FetchDataException(errorMessage: "No internet!!"));
    }
  }


  Future<dynamic> postApi({required String url, Map<String, dynamic>? bodyParams}) async {
    var uri = Uri.parse(url);

    http.Response response = await http.post(uri, body: bodyParams ?? {"name" : "test", "job" : "testjob"});
    if(response.statusCode == 200){
      UserModel userModel = jsonDecode(response.body);
      return userModel;
      // print(userModel);
    } else {
      return null; 
    }
  }

  dynamic returnJsonResponse(http.Response response){
    switch(response.statusCode){
      case 200:{
        var data = jsonDecode(response.body);
        print(data);
        return data;
      }
      case 400: throw BadRequestException(errorMessage: response.body.toString());
      case 401:
      case 403: throw UnAuthorisedException(errorMessage: response.body.toString());
      case 500: throw InvalidException(errorMessage: response.body.toString());
      default: throw FetchDataException(errorMessage: "error occured while communication with server with status code: ${response.statusCode}");
    }
  }
}