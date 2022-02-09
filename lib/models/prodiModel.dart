class ProdiModel {
  ProdiModel({
    this.idProdi,
    this.namaProdi,
  });

  String? idProdi;
  String? namaProdi;

  factory ProdiModel.fromJson(Map<String, dynamic> json) => ProdiModel(
        idProdi: json["id_prodi"] == null ? null : json["id_prodi"],
        namaProdi: json["nama_prodi"] == null ? null : json["nama_prodi"],
      );

  Map<String, dynamic> toJson() => {
        "nama_prodi": namaProdi == null ? null : namaProdi,
      };
}
