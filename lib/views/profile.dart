import 'package:doa_api/controller/controller_services.dart';
import 'package:doa_api/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Service controller = Get.put<Service>(Service());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        backgroundColor: Color(0xff7abd87),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 0, top: 0, bottom: 10),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 30),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Color(0xFFeaeee5),
                  ),
                  title: Text(
                    'Emma',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Color(0xFFeaeee5),
                  ),
                  title: Text(
                    'emma.wong@reqres.in',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ])));
  }
}
