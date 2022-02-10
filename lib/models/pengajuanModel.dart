class PengajuanModel {
  PengajuanModel({
    this.id,
    this.idUser,
    this.idDosen,
    this.title,
    this.message,
    this.startEvent,
    this.endEvent,
    this.status,
    this.name,
    this.nipNim,
    this.email,
    this.password,
    this.idRole,
    this.idProdi,
    this.image,
    this.dateCreated,
    this.startDate,
    this.endDate,
  });

  String? id;
  String? idUser;
  String? idDosen;
  String? title;
  String? message;
  DateTime? startEvent;
  DateTime? endEvent;
  String? status;
  String? name;
  String? nipNim;
  String? email;
  String? password;
  String? idRole;
  String? idProdi;
  String? image;
  String? dateCreated;
  String? startDate;
  String? endDate;

  factory PengajuanModel.fromJson(Map<String, dynamic> json) => PengajuanModel(
        id: json["id"] == null ? null : json["id"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        idDosen: json["id_dosen"] == null ? null : json["id_dosen"],
        title: json["title"] == null ? null : json["title"],
        message: json["message"] == null ? null : json["message"],
        startEvent: json["start_event"] == null ? null : DateTime.parse(json["start_event"]),
        endEvent: json["end_event"] == null ? null : DateTime.parse(json["end_event"]),
        status: json["status"] == null ? null : json["status"],
        name: json["name"] == null ? null : json["name"],
        nipNim: json["nip/nim"] == null ? null : json["nip/nim"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        idRole: json["id_role"] == null ? null : json["id_role"],
        idProdi: json["id_prodi"] == null ? null : json["id_prodi"],
        image: json["image"] == null ? null : json["image"],
        dateCreated: json["date_created"] == null ? null : json["date_created"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser == null ? null : idUser,
        "id_dosen": idDosen == null ? null : idDosen,
        "title": title == null ? null : title,
        "message": message == null ? null : message,
        "start_event": startDate == null ? null : startDate,
        "end_event": endDate == null ? null : endDate,
      };

       Map<String, dynamic> accPengajuan() => {
       
        "message": message == null ? null : message,
        "status": status == null ? null : status,
      };
}
