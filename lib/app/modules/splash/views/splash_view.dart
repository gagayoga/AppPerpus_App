import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF5566FF);

    double width = MediaQuery.of(context).size.width;

    // Fungsi untuk berpindah halaman otomatis ke login
    Future.delayed(
        const Duration(milliseconds: 5500),((){
        String? status = StorageProvider.read(StorageKey.status);
        if (status == "logged") {
          Get.offAllNamed(Routes.DASHBOARD);
        }else{
          Get.offAllNamed(Routes.LOGIN);
        }
      })
    );

    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'lib/assets/logo/logo_aplikasi.svg',
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(
                    height: 45,
                  ),

                  const CircularProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: width * 0.08),
              child: AutoSizeText.rich(
                TextSpan(
                  text: "Powered by ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.black, // Color for the fixed text
                  ),
                  children: [
                    TextSpan(
                      text: "rdestaghifari",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: primary, // Color for the username
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
