import 'package:doa_api/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/controller_services.dart';

iniButton(Service controller, BuildContext context) {
  return Container(
    width: 214,
    height: 50,
    decoration: BoxDecoration(
      color: Color(0xFF3E7355),
      borderRadius: BorderRadius.all(
        Radius.circular(50),
      ),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF3E7355),
      ),
      child: Text(
        'Login',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        controller.login().then((value) {
          if (value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            //create snackbar scaffold succes
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Success"),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            //create snackbar scaffold failed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Login Failed"),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
              ),
            );
          }
        });
      },
    ),
  );
}
