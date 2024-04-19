import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customButton.dart';
import '../../../components/customTextField.dart';
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
          backgroundColor: const Color(0xFF5566FF),
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
                            color: Colors.white,
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
                            color: Colors.white,
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
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          width: width,
            height: height,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: kontenProfileUser(width, height),
            )),
    );
  }

  Widget kontenProfileUser(double width, double height){
    return Obx((){
      if(controller.detailProfile.value == null){
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5566FF)),
          ),
        );
      }else{
        var dataUser = controller.detailProfile.value;
        return SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
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
                              dataUser!.namaLengkap.toString(),
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
                              dataUser!.email.toString(),
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

                CustomTextField(
                  labelText: 'NamaLengkap',
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

                CustomTextField(
                  labelText: 'Username',
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

                CustomTextField(
                  labelText: 'Email',
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

                CustomTextField(
                  labelText: 'Bio',
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

                CustomTextField(
                  labelText: 'Nomor Telepon',
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
                  height: 40,
                ),

                CustomButton(
                  onPressed: ()=> controller.updateProfilePost(),
                  backgroundColor: const Color(0xFF5566FF),
                  child: Obx(() => controller.loading.value?
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ): Text(
                    "Update Profile",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  ),
                ),

              ],
            ),
          ),
        );
      }
    });
  }
}
