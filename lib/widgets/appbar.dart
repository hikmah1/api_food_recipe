import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xff7abd87),
    elevation: 0,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: "Food",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Color(0xff3e7e55),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ))),
          TextSpan(
            text: "Recipe",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Color(0xffcadec8),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
