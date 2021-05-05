import 'package:flutter_bloc_2021/data/models/user_model.dart';
import 'package:flutter_bloc_2021/data/services/user_service.dart';

class UserRepository {
  // final UserService userService;
  final userService = new UserService();

  Future<List<UserModel>> getUserList() async {
    return await userService.getUserList();
  }
}
