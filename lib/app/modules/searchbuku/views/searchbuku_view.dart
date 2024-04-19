import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/customSearchTextField.dart';
import '../../../data/model/buku/response_search_buku.dart';
import '../../../routes/app_pages.dart';
import '../controllers/searchbuku_controller.dart';

class SearchbukuView extends GetView<SearchbukuController> {
  const SearchbukuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.040,
                ),

                CustomSearchTextField(
                  onChanged: (value){
                    controller.getDataBook();
                  },
                  controller: controller.searchController,
                  hinText: "Cari buku kesukaanmu",
                  labelText: "Pencarian Buku",
                  obsureText: false,
                  prefixIcon: const Icon(Icons.search_rounded),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Pleasse input search buku';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: height * 0.020,
                ),

                Obx(
                      () {
                    if (controller.searchController.text.isEmpty) {
                      return controller.searchBook.isEmpty
                          ? sectionDataKosong('Buku')
                          : kontenSemuaBuku();
                    } else {
                      return kontenSemuaBuku();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget kontenSemuaBuku(){
    const Color primary = Color(0xFF5566FF);
    return  Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Obx(() {
            if (controller.searchBook.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(primary),
                ),
              );
            }else{
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.searchBook.length,
                itemBuilder: (context, index){
                  var kategori = controller.searchBook[index].kategoriBuku;
                  var bukuList = controller.searchBook[index].dataBuku;
                  if (bukuList == null || bukuList.isEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            kategori!,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xFF5566FF),
                                borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Belum ada bukuList dalam kategori ini',
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.3,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            kategori!,
                            style: GoogleFonts.plusJakartaSans(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: SizedBox(
                          height: 290, // Sesuaikan tinggi container sesuai kebutuhan Anda
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: bukuList.length,
                            itemBuilder: (context, index) {
                              DataBuku buku = bukuList[index];
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
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    width: 145,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black.withOpacity(0.15),  // Warna garis
                                          width: 0.5,           // Lebar garis
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 145,
                                          height: 175,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: AspectRatio(
                                              aspectRatio: 4 / 5,
                                              child: Image.network(
                                                buku.coverBuku.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 8),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                buku.judul!,
                                                style: GoogleFonts.plusJakartaSans(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 14.0
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.start,
                                              ),

                                              const SizedBox(height: 4),

                                              FittedBox(
                                                child: Text(
                                                  "Penulis : ${buku.penulis}",
                                                  style: GoogleFonts.plusJakartaSans(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 10.0
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),

                                              const SizedBox(height: 4),

                                              FittedBox(
                                                child: Text(
                                                  "Penerbit : ${buku.penerbit}",
                                                  style: GoogleFonts.plusJakartaSans(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 10.0
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),

                                              const SizedBox(height: 2),

                                              FittedBox(
                                                child: Text(
                                                  "${buku.jumlahHalaman} Halaman",
                                                  style: GoogleFonts.plusJakartaSans(
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 10.0
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),

                                              const SizedBox(height: 3),

                                              // Menampilkan rating di bawah teks penulis
                                              buku.rating != null && buku.rating! > 0
                                                  ? RatingBarIndicator(
                                                rating: buku.rating!,
                                                direction: Axis.horizontal,
                                                itemCount: 5,
                                                itemSize: 15,
                                                itemBuilder: (context, _) => const Icon(
                                                  Icons.star,
                                                  color: primary,
                                                ),
                                              )
                                                  : RatingBarIndicator(
                                                rating: buku.rating!,
                                                direction: Axis.horizontal,
                                                itemCount: 5,
                                                itemSize: 15,
                                                itemBuilder: (context, _) => const Icon(
                                                  Icons.star,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
          )
        ],
      ),
    );
  }

  Widget sectionDataKosong(String text) {
    const Color background = Color(0xFF5566FF);
    return Center(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Sorry Data $text Empty!',
            style: GoogleFonts.plusJakartaSans(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
