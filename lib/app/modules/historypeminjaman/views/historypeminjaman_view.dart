import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/historypeminjaman_controller.dart';

class HistorypeminjamanView extends GetView<HistorypeminjamanController> {
  const HistorypeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
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
                          'History Peminjaman Buku',
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
                          'Kumpulan history peminjaman buku Anda.',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: Colors.grey,
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
              padding: const EdgeInsets.only(right: 10),
              child: RefreshIndicator(
                onRefresh: () async {
                  await controller.getDataPeminjaman();
                },
                child: GestureDetector(
                  onTap: () async {
                    await controller.getDataPeminjaman();
                  },
                  child: const Icon(
                    CupertinoIcons.refresh_circled_solid,
                    color: Color(0xFF5566FF),
                    size: 30,
                  ),
                ),
              ),
            )
          ],
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
      if (controller.historyPeminjaman.isEmpty) {
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
                'Belum ada koleksi dataHistory yang tersimpan',
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
              await controller.getDataPeminjaman();
            },
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children:
                    List.generate(
                      controller.historyPeminjaman.length,
                          (index) {
                        var dataHistory = controller.historyPeminjaman[index];
                        return InkWell(
                          onTap: (){
                            dataHistory.status == 'Selesai' ? controller.kontenBeriUlasan(dataHistory.bukuId.toString(), dataHistory.judulBuku.toString())
                                : (){

                            };
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
                                                  dataHistory.coverBuku.toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),

                                            Positioned(
                                              left: 0,
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: dataHistory.status == 'Ditolak'
                                                        ? const Color(0xFFEA1818)
                                                        : dataHistory.status == 'Dipinjam'
                                                        ? const Color(0xFF56526F)
                                                        : dataHistory.status ==
                                                        'Selesai'
                                                        ? const Color(0xFF5566FF)
                                                        : const Color(0xFF1B1B1D),
                                                    borderRadius: const BorderRadius.only(
                                                      bottomLeft: Radius.circular(10),
                                                      bottomRight: Radius.circular(10),
                                                    )),
                                                child: Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        vertical: 10, horizontal: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: [
                                                        dataHistory.status == 'Selesai' ? const SizedBox() : const Icon(
                                                          Icons.info_rounded,
                                                          color: Colors.white,
                                                          size: 20,
                                                        ),


                                                        dataHistory.status == 'Selesai' ? const SizedBox() : const SizedBox(
                                                          width: 10,
                                                        ),

                                                        Text(
                                                          dataHistory.status == 'Selesai' ? 'Beri Ulasan' : dataHistory.status.toString(),
                                                          style: GoogleFonts.averiaGruesaLibre(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16,
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dataHistory.kodePeminjaman!,
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
                                            dataHistory.judulBuku!,
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF584141),
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -0.3
                                            ),
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Tanggal Pinjam : ${dataHistory.tanggalPinjam!}',
                                            style: GoogleFonts.inter(
                                                color: const Color(0xFF584141),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -0.3
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Deadline Pinjam : ${dataHistory.deadline!}',
                                            style: GoogleFonts.inter(
                                                color: const Color(0xFF584141),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -0.3
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Tanggal Kembali : ${dataHistory.tanggalKembali!}',
                                            style: GoogleFonts.inter(
                                                color: const Color(0xFF584141),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -0.3
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
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
