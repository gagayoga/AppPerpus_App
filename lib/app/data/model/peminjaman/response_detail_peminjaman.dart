/// Status : 200
/// Message : "Berhasil Menampilkan Detail Peminjaman"
/// data : {"PeminjamanID":24,"kode_peminjaman":"2024HHD053","status":"Dipinjam","username":"Pasya Rizky","email":"pasya01@smk.belajar.id","tanggal_pinjam":"2024-04-05","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-19","buku_id":2,"cover_buku":"http://192.168.43.21:8000/storage/images/coverbook/The Principles of Power.png","judul_buku":"The Principles of Power","penulis_buku":"Andrea Hirata","penerbit_buku":"Naver Webtoon","tahun_buku":"2013"}

class ResponseDetailPeminjaman {
  ResponseDetailPeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponseDetailPeminjaman.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DetailPeminjaman.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DetailPeminjaman? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// PeminjamanID : 24
/// kode_peminjaman : "2024HHD053"
/// status : "Dipinjam"
/// username : "Pasya Rizky"
/// email : "pasya01@smk.belajar.id"
/// tanggal_pinjam : "2024-04-05"
/// tanggal_kembali : "Belum dikembalikan"
/// Deadline : "2024-04-19"
/// buku_id : 2
/// cover_buku : "http://192.168.43.21:8000/storage/images/coverbook/The Principles of Power.png"
/// judul_buku : "The Principles of Power"
/// penulis_buku : "Andrea Hirata"
/// penerbit_buku : "Naver Webtoon"
/// tahun_buku : "2013"

class DetailPeminjaman {
  DetailPeminjaman({
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

  DetailPeminjaman.fromJson(dynamic json) {
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