import 'package:gym_organizado/DataLayer/DataProvaiders/gymProvaider.dart';
import 'package:gym_organizado/DataLayer/Models/loginUserModel.dart';

class AuthRepository {
  final gymProvider = GymApi();

  Future<UserLoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    var request = await gymProvider.loginUser(email, password);
    final userLoginModel = UserLoginModel.fromJson(request.body);
    print(userLoginModel.user.name);
    return userLoginModel;
  }
}
