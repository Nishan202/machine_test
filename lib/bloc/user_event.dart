
import 'package:machine_test/model/api_models/user_model.dart';

abstract class UserEvent {}

class UserGetRequestEvent extends UserEvent{}
class UserPostRequestEvent extends UserEvent{
  Map<String, dynamic>? userData;
  UserPostRequestEvent({required this.userData});
}
class UserPutRequestEvent extends UserEvent{}