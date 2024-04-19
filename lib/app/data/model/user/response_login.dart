/// status : 200
/// message : "Login Berhasil"
/// data : {"id":1,"email":"pasyapradana@smk.belajar.id","Username":"Pasyaxexeee","nama_lengkap":"Pasyadcdceee","telepon":"098762345671","bio":"hsuxbdcubcubcc","level":"User","token":"9|nsK8bSMLxRDhldxNKXIGAnT1QkYiAbTC4OxTk5AE05d60868"}

class ResponseLogin {
  ResponseLogin({
      this.status, 
      this.message, 
      this.data,});

  ResponseLogin.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataLogin? data;

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
/// token : "9|nsK8bSMLxRDhldxNKXIGAnT1QkYiAbTC4OxTk5AE05d60868"

class DataLogin {
  DataLogin({
      this.id, 
      this.email, 
      this.username, 
      this.namaLengkap, 
      this.telepon, 
      this.bio, 
      this.level, 
      this.token,});

  DataLogin.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    username = json['Username'];
    namaLengkap = json['nama_lengkap'];
    telepon = json['telepon'];
    bio = json['bio'];
    level = json['level'];
    token = json['token'];
  }
  int? id;
  String? email;
  String? username;
  String? namaLengkap;
  String? telepon;
  String? bio;
  String? level;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['Username'] = username;
    map['nama_lengkap'] = namaLengkap;
    map['telepon'] = telepon;
    map['bio'] = bio;
    map['level'] = level;
    map['token'] = token;
    return map;
  }

}