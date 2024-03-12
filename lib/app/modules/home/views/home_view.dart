import 'package:appperpus_app/app/data/provider/storage_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    const Color primary = Color(0xFF5566FF);
    const Color background = Color(0xFF000000);
    const Color colorText = Color(0xFF8B8B8B);

    String username = StorageProvider.read(StorageKey.username);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AutoSizeText.rich(
                  TextSpan(
                    text: "Hallo ",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.black, // Color for the fixed text
                    ),
                    children: [
                      TextSpan(
                        text: "$username",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: primary, // Color for the username
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
