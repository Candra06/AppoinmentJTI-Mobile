class AuthModel {
    AuthModel({
        this.status,
        this.data,
        this.message,
    });

    bool? status;
    Data? data;
    String? message;

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "data": data == null ? null : data?.toJson(),
        "message": message == null ? null : message,
    };
}

class Data {
    Data({
        this.idUser,
        this.email,
        this.idRole,
        this.image,
    });

    String? idUser;
    String? email;
    String? idRole;
    String? image;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idUser: json["id_user"] == null ? null : json["id_user"],
        email: json["email"] == null ? null : json["email"],
        idRole: json["id_role"] == null ? null : json["id_role"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser == null ? null : idUser,
        "email": email == null ? null : email,
        "id_role": idRole == null ? null : idRole,
        "image": image == null ? null : image,
    };
}
