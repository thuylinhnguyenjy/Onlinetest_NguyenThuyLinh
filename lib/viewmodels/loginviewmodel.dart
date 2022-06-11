import 'dart:async';
import 'dart:developer';

import 'package:onlinetest/models/usermodel.dart';
import 'package:onlinetest/services/dbhelper.dart';

class LoginViewModel {

  bool login (User user)  {
    DBHelper dbHelper = DBHelper();
    Future<String> res;
    User userType = User(username: user.username, password: user.password);

    res = dbHelper.loginByUsername(userType);

    res.then((dynamic result){
        if (result != userType.password) {
          log('Fail login');
          return false;
        }
    });
    log('Success login');
    return true;
  }
}


