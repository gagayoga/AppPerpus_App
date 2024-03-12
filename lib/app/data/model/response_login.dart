/// status : 200
/// message : "Login Berhasil"
/// data : {"id":1,"email":"pasya@smk.belajar.id","username":"Pasya","level":"User","token":"1|Sfe3Pb9YkBUowxFYdAiPgjFIWLYkLtZkwDqd17aDf60c8809"}

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
/// email : "pasya@smk.belajar.id"
/// username : "Pasya"
/// level : "User"
/// token : "1|Sfe3Pb9YkBUowxFYdAiPgjFIWLYkLtZkwDqd17aDf60c8809"

class DataLogin {
  DataLogin({
      this.id, 
      this.email, 
      this.username, 
      this.level, 
      this.token,});

  DataLogin.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    level = json['level'];
    token = json['token'];
  }
  int? id;
  String? email;
  String? username;
  String? level;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['username'] = username;
    map['level'] = level;
    map['token'] = token;
    return map;
  }

}