/// Status : 200
/// Message : "Berhasil Menampilkan Detail Buku"
/// data : {"Buku":{"BukuID":1,"Deskripsi":"Dalam cerita Laskar Pelangi, kita mengenal Ikal sebagai tokoh aku. Di novel Sang Pemimpi, masa SMA Ikal ini akan diceritakan. Bersama Arai dan Jimbron, semangat Ikal untuk menjelajahi Eropa hingga Afrika akan tergugah. Hal ini tak lepas dari campur tangan guru mereka.\n\nJudul “Sang Pemimpi” agaknya sangat cocok dengan karakter novel yang menggugah semangat ini. Novel ini bisa membangkitkan harapan dan menginspirasi, meskipun melalui jalan kemiskinan dan masalah sosial yang berlika-liku. Terlebih, penulisnya membeberkan komentar tentang masalah sosial dengan nada jenaka, membuat pembacanya tertawa miris dalam ironi.\n\nDi dunia nyata, pada dasarnya kita tak melulu dapat termotivasi. Namun, novel ini dipandang sebagai cerita yang realistis daripada menyuapi kita dengan cerita dunia yang pesimis, sehingga sudut pandangnya melihat berbagai kemungkinan untuk menggapai mimpi. Meski hidup dalam kenyataan menjadi orang miskin di Belitung, Ikal bisa menyadari bahwa melakukan hal terbaik yang bisa dilakukan saat ini adalah langkah paling realistis dari pemikiran apa pun.","CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Buku Latihan Mantappu Jiwa.png","Judul":"Buku Latihan Mantappu Jiwa","Penulis":"Jerome Polin Sijabat","Penerbit":"Republika","TahunTerbit":"2006","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Tersimpan","StatusPeminjaman":"Belum dipinjam","JenisBuku":"Popular"},"Kategori":["Novel","Pendidikan"],"Ulasan":[{"UlasanID":1,"UserID":2,"BukuID":1,"Ulasan":"Keren bukunya, rekomendasi buat kalian pokoknya mah. Keren bukunya, Mantap rekomendasi buat kalian pokoknya mah. Keren bukunya, rekomendasi buat kalian pokoknya mah.","Rating":5,"created_at":"2024-04-07T08:26:35.000000Z","updated_at":"2024-04-07T08:26:35.000000Z","users":{"id":2,"Username":"Pasyaaaa","Bio":null,"ImageProfile":null,"NamaLengkap":null,"NoTelepon":null,"Email":"pasyarisky@smk.belajar.id","Password":"$2y$12$hhMW1DSdc/ORTiJ8XXrIBOv/IxZo4XzWIT10dVVnCxslnUSxJIyBS","Level":"User","created_at":"2024-04-07T08:25:08.000000Z","updated_at":"2024-04-07T08:25:08.000000Z"}}]}

class ResponseDetailBuku {
  ResponseDetailBuku({
      this.status, 
      this.message, 
      this.data,});

  ResponseDetailBuku.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataDetailBuku.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataDetailBuku? data;

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

/// Buku : {"BukuID":1,"Deskripsi":"Dalam cerita Laskar Pelangi, kita mengenal Ikal sebagai tokoh aku. Di novel Sang Pemimpi, masa SMA Ikal ini akan diceritakan. Bersama Arai dan Jimbron, semangat Ikal untuk menjelajahi Eropa hingga Afrika akan tergugah. Hal ini tak lepas dari campur tangan guru mereka.\n\nJudul “Sang Pemimpi” agaknya sangat cocok dengan karakter novel yang menggugah semangat ini. Novel ini bisa membangkitkan harapan dan menginspirasi, meskipun melalui jalan kemiskinan dan masalah sosial yang berlika-liku. Terlebih, penulisnya membeberkan komentar tentang masalah sosial dengan nada jenaka, membuat pembacanya tertawa miris dalam ironi.\n\nDi dunia nyata, pada dasarnya kita tak melulu dapat termotivasi. Namun, novel ini dipandang sebagai cerita yang realistis daripada menyuapi kita dengan cerita dunia yang pesimis, sehingga sudut pandangnya melihat berbagai kemungkinan untuk menggapai mimpi. Meski hidup dalam kenyataan menjadi orang miskin di Belitung, Ikal bisa menyadari bahwa melakukan hal terbaik yang bisa dilakukan saat ini adalah langkah paling realistis dari pemikiran apa pun.","CoverBuku":"http://192.168.43.21:8000/storage/images/coverbook/Buku Latihan Mantappu Jiwa.png","Judul":"Buku Latihan Mantappu Jiwa","Penulis":"Jerome Polin Sijabat","Penerbit":"Republika","TahunTerbit":"2006","JumlahHalaman":"438","Rating":5,"Total_ulasan":1,"JumlahRating":5,"JumlahPeminjam":1,"Status":"Tersimpan","StatusPeminjaman":"Belum dipinjam","JenisBuku":"Popular"}
/// Kategori : ["Novel","Pendidikan"]
/// Ulasan : [{"UlasanID":1,"UserID":2,"BukuID":1,"Ulasan":"Keren bukunya, rekomendasi buat kalian pokoknya mah. Keren bukunya, Mantap rekomendasi buat kalian pokoknya mah. Keren bukunya, rekomendasi buat kalian pokoknya mah.","Rating":5,"created_at":"2024-04-07T08:26:35.000000Z","updated_at":"2024-04-07T08:26:35.000000Z","users":{"id":2,"Username":"Pasyaaaa","Bio":null,"ImageProfile":null,"NamaLengkap":null,"NoTelepon":null,"Email":"pasyarisky@smk.belajar.id","Password":"$2y$12$hhMW1DSdc/ORTiJ8XXrIBOv/IxZo4XzWIT10dVVnCxslnUSxJIyBS","Level":"User","created_at":"2024-04-07T08:25:08.000000Z","updated_at":"2024-04-07T08:25:08.000000Z"}}]

class DataDetailBuku {
  DataDetailBuku({
      this.buku, 
      this.kategori, 
      this.ulasan,});

  DataDetailBuku.fromJson(dynamic json) {
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    kategori = json['Kategori'] != null ? json['Kategori'].cast<String>() : [];
    if (json['Ulasan'] != null) {
      ulasan = [];
      json['Ulasan'].forEach((v) {
        ulasan?.add(Ulasan.fromJson(v));
      });
    }
  }
  Buku? buku;
  List<String>? kategori;
  List<Ulasan>? ulasan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (buku != null) {
      map['Buku'] = buku?.toJson();
    }
    map['Kategori'] = kategori;
    if (ulasan != null) {
      map['Ulasan'] = ulasan?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UlasanID : 1
/// UserID : 2
/// BukuID : 1
/// Ulasan : "Keren bukunya, rekomendasi buat kalian pokoknya mah. Keren bukunya, Mantap rekomendasi buat kalian pokoknya mah. Keren bukunya, rekomendasi buat kalian pokoknya mah."
/// Rating : 5
/// created_at : "2024-04-07T08:26:35.000000Z"
/// updated_at : "2024-04-07T08:26:35.000000Z"
/// users : {"id":2,"Username":"Pasyaaaa","Bio":null,"ImageProfile":null,"NamaLengkap":null,"NoTelepon":null,"Email":"pasyarisky@smk.belajar.id","Password":"$2y$12$hhMW1DSdc/ORTiJ8XXrIBOv/IxZo4XzWIT10dVVnCxslnUSxJIyBS","Level":"User","created_at":"2024-04-07T08:25:08.000000Z","updated_at":"2024-04-07T08:25:08.000000Z"}

class Ulasan {
  Ulasan({
      this.ulasanID, 
      this.userID, 
      this.bukuID, 
      this.ulasan, 
      this.rating, 
      this.createdAt, 
      this.updatedAt, 
      this.users,});

  Ulasan.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    ulasan = json['Ulasan'];
    rating = json['Rating'].toDouble();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }
  int? ulasanID;
  int? userID;
  int? bukuID;
  String? ulasan;
  double? rating;
  String? createdAt;
  String? updatedAt;
  Users? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (users != null) {
      map['users'] = users?.toJson();
    }
    return map;
  }

}

/// id : 2
/// Username : "Pasyaaaa"
/// Bio : null
/// ImageProfile : null
/// NamaLengkap : null
/// NoTelepon : null
/// Email : "pasyarisky@smk.belajar.id"
/// Password : "$2y$12$hhMW1DSdc/ORTiJ8XXrIBOv/IxZo4XzWIT10dVVnCxslnUSxJIyBS"
/// Level : "User"
/// created_at : "2024-04-07T08:25:08.000000Z"
/// updated_at : "2024-04-07T08:25:08.000000Z"

class Users {
  Users({
      this.id, 
      this.username, 
      this.bio, 
      this.imageProfile, 
      this.namaLengkap, 
      this.noTelepon, 
      this.email, 
      this.password, 
      this.level, 
      this.createdAt, 
      this.updatedAt,});

  Users.fromJson(dynamic json) {
    id = json['id'];
    username = json['Username'];
    bio = json['Bio'];
    imageProfile = json['ImageProfile'];
    namaLengkap = json['NamaLengkap'];
    noTelepon = json['NoTelepon'];
    email = json['Email'];
    password = json['Password'];
    level = json['Level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? username;
  dynamic bio;
  dynamic imageProfile;
  dynamic namaLengkap;
  dynamic noTelepon;
  String? email;
  String? password;
  String? level;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['Username'] = username;
    map['Bio'] = bio;
    map['ImageProfile'] = imageProfile;
    map['NamaLengkap'] = namaLengkap;
    map['NoTelepon'] = noTelepon;
    map['Email'] = email;
    map['Password'] = password;
    map['Level'] = level;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// BukuID : 1
/// Deskripsi : "Dalam cerita Laskar Pelangi, kita mengenal Ikal sebagai tokoh aku. Di novel Sang Pemimpi, masa SMA Ikal ini akan diceritakan. Bersama Arai dan Jimbron, semangat Ikal untuk menjelajahi Eropa hingga Afrika akan tergugah. Hal ini tak lepas dari campur tangan guru mereka.\n\nJudul “Sang Pemimpi” agaknya sangat cocok dengan karakter novel yang menggugah semangat ini. Novel ini bisa membangkitkan harapan dan menginspirasi, meskipun melalui jalan kemiskinan dan masalah sosial yang berlika-liku. Terlebih, penulisnya membeberkan komentar tentang masalah sosial dengan nada jenaka, membuat pembacanya tertawa miris dalam ironi.\n\nDi dunia nyata, pada dasarnya kita tak melulu dapat termotivasi. Namun, novel ini dipandang sebagai cerita yang realistis daripada menyuapi kita dengan cerita dunia yang pesimis, sehingga sudut pandangnya melihat berbagai kemungkinan untuk menggapai mimpi. Meski hidup dalam kenyataan menjadi orang miskin di Belitung, Ikal bisa menyadari bahwa melakukan hal terbaik yang bisa dilakukan saat ini adalah langkah paling realistis dari pemikiran apa pun."
/// CoverBuku : "http://192.168.43.21:8000/storage/images/coverbook/Buku Latihan Mantappu Jiwa.png"
/// Judul : "Buku Latihan Mantappu Jiwa"
/// Penulis : "Jerome Polin Sijabat"
/// Penerbit : "Republika"
/// TahunTerbit : "2006"
/// JumlahHalaman : "438"
/// Rating : 5
/// Total_ulasan : 1
/// JumlahRating : 5
/// JumlahPeminjam : 1
/// Status : "Tersimpan"
/// StatusPeminjaman : "Belum dipinjam"
/// JenisBuku : "Popular"

class Buku {
  Buku({
      this.bukuID, 
      this.deskripsi, 
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
      this.status, 
      this.statusPeminjaman, 
      this.jenisBuku,});

  Buku.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    deskripsi = json['Deskripsi'];
    coverBuku = json['CoverBuku'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    jumlahHalaman = json['JumlahHalaman'];
    rating = json['Rating'].toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
    status = json['Status'];
    statusPeminjaman = json['StatusPeminjaman'];
    jenisBuku = json['JenisBuku'];
  }
  int? bukuID;
  String? deskripsi;
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
  String? statusPeminjaman;
  String? jenisBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Deskripsi'] = deskripsi;
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
    map['StatusPeminjaman'] = statusPeminjaman;
    map['JenisBuku'] = jenisBuku;
    return map;
  }

}