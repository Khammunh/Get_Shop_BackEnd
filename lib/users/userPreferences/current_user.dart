import 'package:get/get.dart';
import 'package:getxshop/users/userPreferences/user_preferences.dart';

import '../model/user.dart';

class CurrentUser extends GetxController {
  Rx<User> _currentUser = User(0, '', '', '').obs;

  User get user => _currentUser.value;

  getUserInfo() async {
    User? getUserInfoFromLocalStorage =
        await RememberUserPreferences.readUserInfo();
    _currentUser.value = getUserInfoFromLocalStorage!;
  }
}
