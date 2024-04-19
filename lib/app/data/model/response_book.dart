/// Status : 200
/// Message : "Berhasil menampilkan data semua buku"
/// data : [{"KategoriBuku":"Novel Fantasy","DataBuku":[{"BukuID":5,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/WindBreaker.png","Judul":"WindBreaker","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Popular"},{"BukuID":6,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/OverLord.png","Judul":"OverLord","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Status":"Tidak Populer"},{"BukuID":7,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Taiko.png","Judul":"Taiko","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Status":"Tidak Populer"},{"BukuID":8,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Naruto Story.png","Judul":"Naruto Story","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Popular"},{"BukuID":9,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Tomb Raider King.png","Judul":"Tomb Raider King","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":4.5,"Total_ulasan":2,"JumlahRating":9,"JumlahPeminjam":0,"Status":"Popular"}]},{"KategoriBuku":"Novel Romance","DataBuku":[{"BukuID":5,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/WindBreaker.png","Judul":"WindBreaker","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Popular"},{"BukuID":6,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/OverLord.png","Judul":"OverLord","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Status":"Tidak Populer"},{"BukuID":8,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Naruto Story.png","Judul":"Naruto Story","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Popular"},{"BukuID":9,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Tomb Raider King.png","Judul":"Tomb Raider King","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":4.5,"Total_ulasan":2,"JumlahRating":9,"JumlahPeminjam":0,"Status":"Popular"},{"BukuID":10,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Jujutsu Kaisen.png","Judul":"Jujutsu Kaisen","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":5,"Total_ulasan":2,"JumlahRating":10,"JumlahPeminjam":1,"Status":"Popular"}]},{"KategoriBuku":"Novel Non Fiksi","DataBuku":[{"BukuID":1,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Buya Hamka.png","Judul":"Buya Hamka","Penulis":"A Fuadi","Penerbit":"Gramedia Center","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Status":"Tidak Populer"},{"BukuID":2,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Ki Hajar Dewantara.png","Judul":"Ki Hajar Dewantara","Penulis":"A Fuadi","Penerbit":"Gramedia Center","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Status":"Tidak Populer"},{"BukuID":3,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/SOEKARNO.png","Judul":"SOEKARNO","Penulis":"Taufik Adi Susilo","Penerbit":"Gramedia Center","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":1,"Status":"Tidak Populer"},{"BukuID":4,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Muhammad Hatta.png","Judul":"Muhammad Hatta","Penulis":"Salman Alfarizi","Penerbit":"Gramedia Center","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":2,"Status":"Tidak Populer"}]}]

class ResponseBook {
  ResponseBook({
      this.status, 
      this.message, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBook.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBook>? data;

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

/// KategoriBuku : "Novel Fantasy"
/// DataBuku : [{"BukuID":5,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/WindBreaker.png","Judul":"WindBreaker","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Popular"},{"BukuID":6,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/OverLord.png","Judul":"OverLord","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Status":"Tidak Populer"},{"BukuID":7,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Taiko.png","Judul":"Taiko","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":0,"Total_ulasan":0,"JumlahRating":0,"JumlahPeminjam":0,"Status":"Tidak Populer"},{"BukuID":8,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Naruto Story.png","Judul":"Naruto Story","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Popular"},{"BukuID":9,"CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Tomb Raider King.png","Judul":"Tomb Raider King","Penulis":"Syoung Youn Kwon","Penerbit":"Naver Webtoon","TahunTerbit":"2013","JumlahHalaman":"438","Rating":4.5,"Total_ulasan":2,"JumlahRating":9,"JumlahPeminjam":0,"Status":"Popular"}]

class DataBook {
  DataBook({
      this.kategoriBuku, 
      this.dataBuku,});

  DataBook.fromJson(dynamic json) {
    kategoriBuku = json['KategoriBuku'];
    if (json['DataBuku'] != null) {
      dataBuku = [];
      json['DataBuku'].forEach((v) {
        dataBuku?.add(DataBuku.fromJson(v));
      });
    }
  }
  String? kategoriBuku;
  List<DataBuku>? dataBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriBuku'] = kategoriBuku;
    if (dataBuku != null) {
      map['DataBuku'] = dataBuku?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 5
/// CoverBuku : "http://192.168.43.21:8000/storage/images/coverbook/WindBreaker.png"
/// Judul : "WindBreaker"
/// Penulis : "Syoung Youn Kwon"
/// Penerbit : "Naver Webtoon"
/// TahunTerbit : "2013"
/// JumlahHalaman : "438"
/// Rating : 5
/// Total_ulasan : 1
/// JumlahRating : 5
/// JumlahPeminjam : 1
/// Status : "Popular"

class DataBuku {
  DataBuku({
      this.bukuID, 
      this.coverBuku, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam, 
      this.status,});

  DataBuku.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    coverBuku = json['CoverBuku'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    jumlahHalaman = json['JumlahHalaman'];
    rating = json['Rating']?.toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
    status = json['Status'];
  }
  int? bukuID;
  String? coverBuku;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['CoverBuku'] = coverBuku;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['JumlahHalaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    map['Status'] = status;
    return map;
  }

}