/// Status : 201
/// Message : "Berhasil Menambahkan Peminjaman"
/// data : {"PeminjamanID":23,"kode_peminjaman":"2024GCT053","status":"Dipinjam","tanggal_pinjam":"2024-04-05","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-19"}

class ResponsePeminjaman {
  ResponsePeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponsePeminjaman.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataPeminjaman.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataPeminjaman? data;

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

/// PeminjamanID : 23
/// kode_peminjaman : "2024GCT053"
/// status : "Dipinjam"
/// tanggal_pinjam : "2024-04-05"
/// tanggal_kembali : "Belum dikembalikan"
/// Deadline : "2024-04-19"

class DataPeminjaman {
  DataPeminjaman({
      this.peminjamanID, 
      this.kodePeminjaman, 
      this.status, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.deadline,});

  DataPeminjaman.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    kodePeminjaman = json['kode_peminjaman'];
    status = json['status'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    deadline = json['Deadline'];
  }
  int? peminjamanID;
  String? kodePeminjaman;
  String? status;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? deadline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['kode_peminjaman'] = kodePeminjaman;
    map['status'] = status;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['Deadline'] = deadline;
    return map;
  }

}