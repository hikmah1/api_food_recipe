import 'package:flutter/material.dart';

userField(TextEditingController controller) {
  return Container(
    height: 50,
    width: 300,
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

passField(TextEditingController controller) {
  return SizedBox(
    width: 300,
    height: 50,
    child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ))),
  );
}
