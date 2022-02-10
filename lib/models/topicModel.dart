class TopicModel {
  TopicModel({
    this.id,
    this.idUser,
    this.name,
    this.topic,
    this.idDosen,
    this.updateTime,
  });

  String? id;
  String? idUser;
  String? name;
  String? topic;
  String? idDosen;
  DateTime? updateTime;

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        id: json["id"] == null ? null : json["id"],
        idUser: json["id_user"] == null ? null : json["id_user"],
        name: json["name"] == null ? null : json["name"],
        topic: json["topic"] == null ? null : json["topic"],
        updateTime: json["update_time"] == null ? null : DateTime.parse(json["update_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser == null ? null : idUser,
        "id_dosen": idDosen == null ? null : idDosen,
        "topic": topic == null ? null : topic,
      };
}
