import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customButton.dart';
import '../../../components/customTextFieldProfile.dart';
import '../controllers/updateprofile_controller.dart';

class UpdateprofileView extends GetView<UpdateprofileController> {
  const UpdateprofileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF5566FF);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: -10,
          title: SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Profile Pengguna',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Text(
                          'Update Profile Anda ',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: (){
                  controller.updateProfilePost();
                },
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ),
            )
          ],
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
          width: width,
            height: height,
            color: const Color(0xFFF5F5F5),
            child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: kontenProfileUser(width, height),
                ))),
    );
  }

  Widget kontenProfileUser(double width, double height){
    return Obx((){
      if(controller.detailProfile.value == null){
        return const Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5566FF)),
            ),
          ),
        );
      }else{
        var dataUser = controller.detailProfile.value;
        return Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            height: height * 0.015,
                          ),

                          Text(
                            "Edit Foto",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: const Color(0xFF5566FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: height * 0.040,
              ),
              
              Text(
                "Nama Lengkap",
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF584141),
                  fontWeight: FontWeight.w600,
                  fontSize: 12
                ),
              ),

              CustomTextFieldProfile(
                controller: controller.namalengkapController,
                hinText: 'Nama Lengkap',
                obsureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pleasse input nama lengkap';
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Username",
                style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF584141),
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),

              CustomTextFieldProfile(
                controller: controller.usernameController,
                hinText: 'Username',
                obsureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pleasse input username';
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Email",
                style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF584141),
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),

              CustomTextFieldProfile(
                controller: controller.emailController,
                hinText: 'Email',
                obsureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pleasse input email';
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Bio",
                style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF584141),
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),

              CustomTextFieldProfile(
                controller: controller.bioController,
                hinText: 'Bio',
                obsureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pleasse input bio';
                  }

                  return null;
                },
              ),


              const SizedBox(
                height: 15,
              ),

              Text(
                "Nomor Telepon",
                style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF584141),
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),

              CustomTextFieldProfile(
                controller: controller.teleponController,
                hinText: 'Nomor Telepon',
                obsureText: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pleasse input no telepon';
                  }

                  return null;
                },
              ),

              const SizedBox(
                height: 15,
              ),

              Text(
                "Password",
                style: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF584141),
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
              ),

              Obx(() => CustomTextFieldProfile(
                controller: controller.password,
                hinText: 'Password',
                obsureText: controller.isPasswordHidden.value,
                suffixIcon: InkWell(
                  child: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20,
                    color: Colors.black,
                  ),
                  onTap: () {
                    controller.isPasswordHidden.value =
                    !controller.isPasswordHidden.value;
                  },
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Pleasse input no telepon';
                  }

                  return null;
                },
              )),

              const SizedBox(
                height: 40,
              ),

              // CustomButton(
              //   onPressed: ()=> controller.updateProfilePost(),
              //   backgroundColor: const Color(0xFF5566FF),
              //   child: Obx(() => controller.loading.value?
              //   const CircularProgressIndicator(
              //     color: Colors.white,
              //   ): Text(
              //     "Update Profile",
              //     style: GoogleFonts.inter(
              //       fontSize: 20,
              //       color: Colors.white,
              //       fontWeight: FontWeight.w600,
              //     ),
              //   ),
              //   ),
              // ),

            ],
          ),
        );
      }
    });
  }
}
