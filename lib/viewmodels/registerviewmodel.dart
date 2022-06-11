import 'dart:developer';

import 'package:onlinetest/models/usermodel.dart';
import 'package:onlinetest/services/dbhelper.dart';

class RegisterViewModel {

  bool register(User user) {
    DBHelper dbHelper = DBHelper();
    User userType = User(username: user.username, password: user.password);
    var res = dbHelper.createNewUser(userType);

    res.then((dynamic result) {
      if (res != null) {
        //log('Success register');
        return true;
      }
    });
    //log("Fail register");
    return false;
  }
}


