import 'package:dio/dio.dart';
import 'package:doa_api/models/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Service extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var isLogin = false.obs;
  Users? users;
  var user = DataUser().obs;

  void cleanController() {
    emailController.value.clear();
    passwordController.value.clear();
  }

  Future<bool> login() async {
    isLogin.value = false;
    Dio dio = Dio();
    var res = await dio.get("https://reqres.in/api/users");

    Users abc = Users.fromJson(res.data);
    abc.data!.forEach((element) {
      if (element.email == emailController.value.text &&
          element.firstName == passwordController.value.text) {
        user.value = element;
        isLogin.value = true;
        print("Login Berhasil sebagai ${user.value.firstName}");
      }
    });
    cleanController();
    return isLogin.value;
  }

  void logout() {
    isLogin.value = false;
    cleanController();
  }
}
