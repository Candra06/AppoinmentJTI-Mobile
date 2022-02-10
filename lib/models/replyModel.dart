
class ReplyModel {
    ReplyModel({
        this.id,
        this.idChat,
        this.fromBy,
        this.message,
        this.idUser,
        this.updateTime,
    });

    String? id;
    String? idChat;
    String? fromBy;
    String? message;
    String? idUser;
    DateTime? updateTime;

    factory ReplyModel.fromJson(Map<String, dynamic> json) => ReplyModel(
        id: json["id"] == null ? null : json["id"],
        idChat: json["id_chat"] == null ? null : json["id_chat"],
        fromBy: json["from_by"] == null ? null : json["from_by"],
        message: json["message"] == null ? null : json["message"],
        updateTime: json["update_time"] == null ? null : DateTime.parse(json["update_time"]),
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser == null ? null : idUser,
        "id_chat": idChat == null ? null : idChat,
        "message": message == null ? null : message
        
    };
}
