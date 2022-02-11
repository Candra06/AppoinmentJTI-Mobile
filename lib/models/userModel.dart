class UserModel {
  UserModel({
    this.idUser,
    this.name,
    this.nipNim,
    this.email,
    this.password,
    this.idRole,
    this.idProdi,
    this.image,
    this.namaProdi,
    this.dateCreated,
  });

  String? idUser;
  String? name;
  String? nipNim;
  String? email;
  String? password;
  String? idRole;
  String? idProdi;
  String? image;
  String? namaProdi;
  String? dateCreated;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"] == null ? null : json["id_user"],
        name: json["name"] == null ? null : json["name"],
        nipNim: json["nip/nim"] == null ? null : json["nip/nim"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        idRole: json["id_role"] == null ? null : json["id_role"],
        idProdi: json["id_prodi"] == null ? null : json["id_prodi"],
        image: json["image"] == null ? null : json["image"],
        namaProdi: json["nama_prodi"] == null ? null : json["nama_prodi"],
        dateCreated: json["date_created"] == null ? null : json["date_created"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "no_induk": nipNim == null ? null : nipNim,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "id_role": idRole == null ? null : idRole,
        "id_prodi": idProdi == null ? null : idProdi,
      };
}
