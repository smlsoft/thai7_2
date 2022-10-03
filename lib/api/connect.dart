import 'dart:async';
import 'dart:developer';
import 'dart:io' as io;
import 'package:thai7/api/client.dart';
import 'package:thai7/api/user_repository.dart';
import 'package:thai7/global.dart' as global;

Future apiLogin() async {
  if (global.apiConnected == false) {
    if (!global.isLoginProcess) {
      global.isLoginProcess = true;
      UserRepository userRepository = UserRepository();
      await userRepository
          .authenUser(global.apiUserName, global.apiUserPassword)
          .then((result) async {
        if (result.success) {
          global.apiConnected = true;
          global.appConfig.write("token", result.data["token"]);
          log("Login Succerss");
          ApiResponse selectShop =
              await userRepository.selectShop(global.apiShopCode);
          if (selectShop.success) {
            log("Select Shop Sucess");
          }
        }
      }).catchError((e) {
        log(e);
      }).whenComplete(() async {
        global.isLoginProcess = false;
      });
    }
  }
}
