class FacebookModel {
  final String? name;
  final String? email;
  final String? id;
  final FacebookPhotoModel? facebookPhotoModel;

  FacebookModel({this.name, this.email, this.id, this.facebookPhotoModel});

  factory FacebookModel.fromJson(Map<String, dynamic> json) => FacebookModel(
        name: json["name"],
        email: json["email"],
        id: json["id"],
        facebookPhotoModel:
            FacebookPhotoModel.fromJson(json["picture"]["data"]),
      );
}

class FacebookPhotoModel {
  final String? url;
  final String? height;
  final String? width;

  FacebookPhotoModel({this.url, this.height, this.width});

  factory FacebookPhotoModel.fromJson(Map<String, dynamic> json) =>
      FacebookPhotoModel(
        url: json["url"],
        height: json["height"],
        width: json["width"],
      );
}
