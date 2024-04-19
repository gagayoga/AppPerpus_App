/// Status : 200
/// Message : "Berhasil Menampilkan All Buku"
/// data : [{"BukuID":9,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Aspera Ad Astra.png","judul_buku":"Aspera Ad Astra","penulis_buku":"Syoung Youn Kwon","penerbit_buku":"Naver Webtoon","tahun_terbit":"2013","jumlah_halaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0},{"BukuID":8,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Adolf Hitler.png","judul_buku":"Adolf Hitler","penulis_buku":"Syoung Youn Kwon","penerbit_buku":"Naver Webtoon","tahun_terbit":"2013","jumlah_halaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0},null]

class ResponseBookNew {
  ResponseBookNew({
      this.status, 
      this.message, 
      this.data,});

  ResponseBookNew.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBookNew.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBookNew>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 9
/// CoverBuku : "http://192.168.43.21:8000/storage/images/coverbook/Aspera Ad Astra.png"
/// judul_buku : "Aspera Ad Astra"
/// penulis_buku : "Syoung Youn Kwon"
/// penerbit_buku : "Naver Webtoon"
/// tahun_terbit : "2013"
/// jumlah_halaman : "438"
/// Rating : 0
/// Total_ulasan : 0
/// JumlahRating : 0
/// JumlahPeminjam : 0

class DataBookNew {
  DataBookNew({
      this.bukuID, 
      this.coverBuku, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam,});

  DataBookNew.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    coverBuku = json['CoverBuku'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    tahunTerbit = json['tahun_terbit'];
    jumlahHalaman = json['jumlah_halaman'];
    rating = json['Rating']?.toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
  }
  int? bukuID;
  String? coverBuku;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['CoverBuku'] = coverBuku;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['tahun_terbit'] = tahunTerbit;
    map['jumlah_halaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    return map;
  }

}