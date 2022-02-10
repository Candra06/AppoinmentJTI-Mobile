class EventDosenModel {
  EventDosenModel({
    this.id,
    this.title,
    this.startEvent,
    this.endEvent,
    this.idUser,
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
  String? title;
  DateTime? startEvent;
  DateTime? endEvent;
  String? idUser;
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

  factory EventDosenModel.fromJson(Map<String, dynamic> json) => EventDosenModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        startEvent: json["start_event"] == null ? null : DateTime.parse(json["start_event"]),
        endEvent: json["end_event"] == null ? null : DateTime.parse(json["end_event"]),
        idUser: json["id_user"] == null ? null : json["id_user"],
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
        "title": title == null ? null : title,
        "start_event": startDate == null ? null : startDate,
        "end_event": endDate == null ? null : endDate,
      };
}
