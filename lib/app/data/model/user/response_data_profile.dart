/// status : 200
/// message : "DataUser profil user"
/// data : {"id":1,"email":"pasyapradana@smk.belajar.id","Username":"Pasyaxexeee","nama_lengkap":"Pasyadcdceee","telepon":"098762345671","bio":"hsuxbdcubcubcc","level":"User"}

class ResponseDataProfile {
  ResponseDataProfile({
      this.status, 
      this.message, 
      this.data,});

  ResponseDataProfile.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataUser? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// email : "pasyapradana@smk.belajar.id"
/// Username : "Pasyaxexeee"
/// nama_lengkap : "Pasyadcdceee"
/// telepon : "098762345671"
/// bio : "hsuxbdcubcubcc"
/// level : "User"

class DataUser {
  DataUser({
      this.id, 
      this.email, 
      this.username, 
      this.namaLengkap, 
      this.telepon, 
      this.bio, 
      this.level,});

  DataUser.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    username = json['Username'];
    namaLengkap = json['nama_lengkap'];
    telepon = json['telepon'];
    bio = json['bio'];
    level = json['level'];
  }
  int? id;
  String? email;
  String? username;
  String? namaLengkap;
  String? telepon;
  String? bio;
  String? level;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['Username'] = username;
    map['nama_lengkap'] = namaLengkap;
    map['telepon'] = telepon;
    map['bio'] = bio;
    map['level'] = level;
    return map;
  }

}