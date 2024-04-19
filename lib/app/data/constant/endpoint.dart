class Endpoint {
  static const String baseUrlApi =
      "http://192.168.4.139:8000/api/users/";

  // Authenticated
  static const String register = "${baseUrlApi}registrasi";
  static const String login = "${baseUrlApi}login";
  static const String logout = "${baseUrlApi}logout";
  static const String getDataProfile = "${baseUrlApi}get-profile";
  static const String updateProfile = "${baseUrlApi}update/profile";

  // Buku
  static const String buku = "${baseUrlApi}buku";
  static const String bukuNew = "${baseUrlApi}buku/new";
  static const String bukuPopular = "${baseUrlApi}popular/buku";
  static const String detailBuku = "${baseUrlApi}buku/detail";
  static const String searchBuku = "${baseUrlApi}buku/search";

  // Koleksi Buku
  static const String koleksiBuku = "${baseUrlApi}koleksi";
  static const String deleteKoleksi = "${baseUrlApi}";

  // Ulasan Buku
  static const String ulasanBuku = "${baseUrlApi}ulasan";

  // Peminjaman
  static const String pinjamBuku = "${baseUrlApi}pinjam";
}