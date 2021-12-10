import 'package:exceptions_flutter/core/error/error.dart';
import 'package:exceptions_flutter/features/user/model/user.dart';

abstract class IUserRepository {
  Future<User> doLogin();
}

class UserRepository implements IUserRepository {
  @override
  Future<User> doLogin() async {
    try {
      final response = await Future.delayed(
          Duration(seconds: 1),
          () => {
                'name': 'Renato Mota',
                'picture': '',
                'bornDate': DateTime(1997, 07, 1).millisecondsSinceEpoch,
                'status': Status.active.toString(),
              });

      return User.fromMap(response);
    } catch (e) {
      throw LoginFailure(message: 'Não foi possível realizar o login');
    }
  }
}
