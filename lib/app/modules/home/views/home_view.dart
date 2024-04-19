import 'package:appperpus_app/app/data/provider/storage_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    const Color primary = Color(0xFF5566FF);

    String username = StorageProvider.read(StorageKey.username);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText.rich(
                  TextSpan(
                    text: "Hallo ",
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black, // Color for the fixed text
                    ),
                    children: [
                      TextSpan(
                        text: username,
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: primary, // Color for the username
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
            
                FittedBox(
                  child: Text(
                    "Hari ini Anda mau baca buku apa?",
                    maxLines: 1,
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            
            const Icon(
              Icons.notifications_rounded,
              color: Color(0xFF5566FF),
              size: 24,
            )
          ],
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.015,
                ),

                  Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: SvgPicture.asset(
                    'lib/assets/images/ucapan.svg',
                    fit: BoxFit.cover
                  ),
                ),

                SizedBox(
                  height: height * 0.020,
                ),

                kontenBukuPopular(),

                SizedBox(
                  height: height * 0.020,
                ),

                kontenBukuTerbaru(),

                SizedBox(
                  height: height * 0.020,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget kontenBukuPopular() {
    const Color primary = Color(0xFF5566FF);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Buku TerPopular",
              maxLines: 1,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            Text(
              "Lihat semua>",
              maxLines: 1,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                color: primary,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(() {
            if (controller.popularBooks.isEmpty) {
              return SizedBox(
                height: 175,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Skeletonizer(
                        enabled: true,
                        child: SizedBox(
                          width: 135,
                          height: 175,
                          child: Container(
                            width: 135,
                            height: 175,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return SizedBox(
                height: 180,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: controller.popularBooks.map((buku) {
                      return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.DETAILBOOK,
                            parameters: {
                              'id': (buku.bukuID ?? 0).toString(),
                              'judul': (buku.judul!).toString()
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120,
                                height: 175,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    buku.coverBuku.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }


  Widget kontenBukuTerbaru() {
    const Color primary = Color(0xFF5566FF);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Buku Terbaru",
              maxLines: 1,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),

            Text(
              "Lihat semua>",
              maxLines: 1,
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600,
                color: primary,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(() {
            if (controller.newBooks.isEmpty) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 135,
                        margin: const EdgeInsets.only(right: 10),
                        child: Skeletonizer(
                          enabled: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 135,
                                height: 175,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 10,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 80,
                                height: 10,
                                color: Colors.grey[300],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 3 / 6,
                ),
                itemCount: controller.newBooks.length,
                itemBuilder: (context, index) {
                  var buku = controller.newBooks[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DETAILBOOK,
                        parameters: {
                          'id': (buku.bukuID ?? 0).toString(),
                          'judul': (buku.judulBuku!).toString()
                        },
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              buku.coverBuku.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          child: Text(
                            buku.judulBuku!,
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 14.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 3),
                        FittedBox(
                          child: Text(
                            "${ buku.jumlahHalaman!} Halaman",
                            maxLines : 1,
                            style: GoogleFonts.inriaSans(
                              fontWeight: FontWeight.w600,
                              color: primary,
                              fontSize: 12.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 3),
                        RatingBarIndicator(
                          rating: buku.rating!,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 15,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: primary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
