import 'package:appperpus_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customButton.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF5566FF);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.050,
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color : const Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'lib/assets/images/profile.png',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),

                      SizedBox(
                        height: height * 0.010,
                      ),

                      Text(
                        controller.usernameUser,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      Text(
                        controller.emailUser,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
            height: height * 0.040,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              onPressed: (){
                Get.toNamed(Routes.UPDATEPROFILE);
              },
              backgroundColor: primary,
              child: Text(
                "Edit Profile",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ),
          ),

          SizedBox(
            height: height * 0.015,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              onPressed: (){
                Get.toNamed(Routes.HISTORYPEMINJAMAN);
              },
              backgroundColor: primary,
              child: Text(
                "History Peminjaman",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(
            height: height * 0.015,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomButton(
              onPressed: (){
                controller.logout();
              },
              backgroundColor: const Color(0xFFB53333),
              child: Text(
                "Logout Akun",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
