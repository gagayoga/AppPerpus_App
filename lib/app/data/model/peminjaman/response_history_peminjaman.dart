/// Status : 200
/// Message : "Berhasil Menampilkan History Peminjaman dari 6"
/// data : [{"PeminjamanID":1,"kode_peminjaman":"2024RCS176","status":"Dipinjam","username":"Shujinko App","email":"shujinkoapp@smk.belajar.id","tanggal_pinjam":"2024-03-17","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-03-24","buku_id":4,"cover_buku":"http://192.168.43.21:8000/storage/images/coverbook/Tensura.png","judul_buku":"Tensura","penulis_buku":"Syoung Youn Kwon","penerbit_buku":"Naver Webtoon","tahun_buku":"2013"}]

class ResponseHistoryPeminjaman {
  ResponseHistoryPeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponseHistoryPeminjaman.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataHistory.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataHistory>? data;

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

/// PeminjamanID : 1
/// kode_peminjaman : "2024RCS176"
/// status : "Dipinjam"
/// username : "Shujinko App"
/// email : "shujinkoapp@smk.belajar.id"
/// tanggal_pinjam : "2024-03-17"
/// tanggal_kembali : "Belum dikembalikan"
/// Deadline : "2024-03-24"
/// buku_id : 4
/// cover_buku : "http://192.168.43.21:8000/storage/images/coverbook/Tensura.png"
/// judul_buku : "Tensura"
/// penulis_buku : "Syoung Youn Kwon"
/// penerbit_buku : "Naver Webtoon"
/// tahun_buku : "2013"

class DataHistory {
  DataHistory({
      this.peminjamanID, 
      this.kodePeminjaman, 
      this.status, 
      this.username, 
      this.email, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.deadline, 
      this.bukuId, 
      this.coverBuku, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.tahunBuku,});

  DataHistory.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    kodePeminjaman = json['kode_peminjaman'];
    status = json['status'];
    username = json['username'];
    email = json['email'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    deadline = json['Deadline'];
    bukuId = json['buku_id'];
    coverBuku = json['cover_buku'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    tahunBuku = json['tahun_buku'];
  }
  int? peminjamanID;
  String? kodePeminjaman;
  String? status;
  String? username;
  String? email;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? deadline;
  int? bukuId;
  String? coverBuku;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  String? tahunBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['kode_peminjaman'] = kodePeminjaman;
    map['status'] = status;
    map['username'] = username;
    map['email'] = email;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['Deadline'] = deadline;
    map['buku_id'] = bukuId;
    map['cover_buku'] = coverBuku;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['tahun_buku'] = tahunBuku;
    return map;
  }

}