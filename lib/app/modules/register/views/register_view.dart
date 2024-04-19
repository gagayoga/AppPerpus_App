import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customButton.dart';
import '../../../components/customTextField.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    const Color primary = Color(0xFF5566FF);
    const Color background = Color(0xFF000000);
    const Color colorText = Color(0xFF8B8B8B);

    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: background,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: width * 0.15),
                            child: SvgPicture.asset(
                              'lib/assets/logo/logo_text.svg',
                            ),
                          ),

                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "Register",
                                  maxFontSize: 35.0,
                                  minFontSize: 20.0,
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),

                                const SizedBox(
                                  height: 5,
                                ),

                                AutoSizeText(
                                  "Silakan buat akun terlebih dahulu",
                                  maxFontSize: 16.0,
                                  minFontSize: 14.0,
                                  maxLines: 1,
                                  style: GoogleFonts.inter(
                                      color: colorText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: width * 0.08),
                            child: CustomTextField(
                              controller: controller.usernameController,
                              hinText: "Radhesta",
                              labelText: "Username",
                              obsureText: false,
                              prefixIcon: const Icon(Icons.email_rounded),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Pleasse input username';
                                }
                                return null;
                              },
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: width * 0.05),
                            child: CustomTextField(
                              controller: controller.emailController,
                              hinText: "radhesta@smk.belajar.id",
                              labelText: "Email",
                              obsureText: false,
                              prefixIcon: const Icon(Icons.email_rounded),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Pleasse input email address';
                                } else if (!EmailValidator.validate(value)) {
                                  return 'Email address tidak sesuai';
                                }else if (!value.endsWith('@smk.belajar.id')){
                                  return 'Email harus @smk.belajar.id';
                                }

                                return null;
                              },
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: width * 0.05),
                            child: Obx(() =>
                                CustomTextField(
                                  controller: controller.passwordController,
                                  hinText: "Password",
                                  labelText: "Password",
                                  obsureText: controller.isPasswordHidden.value,
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: InkWell(
                                    child: Icon(
                                      controller.isPasswordHidden.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 20,
                                      color: colorText,
                                    ),
                                    onTap: () {
                                      controller.isPasswordHidden.value =
                                      !controller.isPasswordHidden.value;
                                    },
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please input password';
                                    } else if (value.length < 8){
                                      return 'Panjang password harus lebih dari 8';
                                    }
                                    // Validasi setidaknya satu huruf besar
                                    else if (!value.contains(RegExp(r'[A-Z]'))) {
                                      return 'Password harus mengandung satu huruf besar';
                                    }
                                    // Validasi setidaknya satu karakter khusus
                                    else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                      return 'Password harus mengandung satu karakter khusus';
                                    }
                                    // Validasi setidaknya satu angka
                                    else if (!value.contains(RegExp(r'[0-9]'))) {
                                      return 'Password harus mengandung minimal 1 angka';
                                    }
                                    return null;
                                  },
                                )
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(top: width * 0.12, bottom: width * 0.04),
                            child: CustomButton(
                              onPressed: ()=> controller.registerPost(),
                              backgroundColor: primary,
                              child: Obx(() => controller.loadinglogin.value?
                              const CircularProgressIndicator(
                                color: Colors.white,
                              ): Text(
                                "Register",
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ),
                            ),
                          ),

                          textToRegister(),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: width * 0.1),
                      child: AutoSizeText.rich(
                        TextSpan(
                          text: "Powered by ",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white, // Color for the fixed text
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  Widget textToRegister() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              'You have an account?',
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF8B8B8B)),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: FittedBox(
              child: Text('Login',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF5566FF),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
