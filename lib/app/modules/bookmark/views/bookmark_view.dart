import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
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
                          'Koleksi Buku Anda',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Text(
                          'Kumpulan buku koleksi Anda.',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),

                  RefreshIndicator(
                    onRefresh: () async {
                      await controller.getData();
                    },
                    child: GestureDetector(
                      onTap: () async {
                        await controller.getData();
                      },
                      child: const Icon(
                        CupertinoIcons.refresh_circled_solid,
                        color: Color(0xFF5566FF),
                        size: 30,
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: kontenKoleksiBuku(),
          ),
        )
    );
  }

  Widget kontenKoleksiBuku() {
    const Color background = Color(0xFF5566FF);
    const Color borderColor = Color(0xFF424242);

    return Obx((){
      if (controller.koleksiBook.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: borderColor.withOpacity(0.20),
                width: 0.3,
              )
          ),
          child: Center(
            child: Text(
              'Belum ada koleksi dataKoleksi yang tersimpan',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    } else {
      return
        RefreshIndicator(
          onRefresh: () async {
            await controller.getData();
          },
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children:
                  List.generate(
                    controller.koleksiBook.length,
                        (index) {
                      var dataKoleksi = controller.koleksiBook[index];
                      return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.DETAILBOOK,
                            parameters: {
                              'id': (dataKoleksi.bukuID ?? 0).toString(),
                              'judul': (dataKoleksi.judul!).toString()
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: MediaQuery.of(Get.context!).size.width,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5).withOpacity(0.60),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            height: 180,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Gambar di sebelah kiri
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 180,
                                    decoration : BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: const Offset(0, 5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    // Lebar gambar 40% dari layar
                                    child: SizedBox(
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: AspectRatio(
                                              aspectRatio: 3 / 4,
                                              child: Image.network(
                                                dataKoleksi.coverBuku.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: (){
                                                controller.deleteKoleksiBook(dataKoleksi.bukuID.toString(), Get.context!);
                                              },
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.white.withOpacity(0.90),
                                                    borderRadius: const BorderRadius.only(
                                                      bottomLeft: Radius.circular(10),
                                                      bottomRight: Radius.circular(10),
                                                    )
                                                ),
                                                child: Center(
                                                  child: InkWell(
                                                    onTap: (){
                                                      controller.deleteKoleksiBook(dataKoleksi.bukuID!.toString(), Get.context!);
                                                    },
                                                    child: const Icon(
                                                      CupertinoIcons.trash_fill,
                                                      color: Color(0xFFFF0000),
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataKoleksi.judul!,
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF584141),
                                            fontSize: 20.0,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          dataKoleksi.deskripsi!,
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFF584141),
                                            fontSize: 12.0,
                                          ),
                                          maxLines: 4,
                                          textAlign: TextAlign.justify,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        RatingBarIndicator(
                                          rating: dataKoleksi.rating!,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemSize: 20,
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
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
                      );
                    },
                  )
              )
          ),
        );
    }
    },
    );
  }
}
