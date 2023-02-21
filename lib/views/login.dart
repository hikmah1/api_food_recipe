import 'package:doa_api/controller/controller_services.dart';
import 'package:doa_api/widgets/button.dart';
import 'package:doa_api/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Service controller = Get.put<Service>(Service());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEEE5),
      body: Center(
        child: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Food Recipe',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF3E7E55),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Login to your account',
                style: GoogleFonts.poppins(
                  color: Color(0xFF3E7E55),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              userField(controller.emailController.value),
              const SizedBox(height: 15),
              passField(controller.passwordController.value),
              const SizedBox(height: 15),
              iniButton(controller, context),
            ],
          ),
        ))),
      ),
    );
  }
}
