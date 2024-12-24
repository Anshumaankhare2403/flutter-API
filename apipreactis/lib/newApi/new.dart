class PostI {
  int? total;
  int? totalPages;
  List<Result>? results;

  PostI({this.total, this.totalPages, this.results});

  PostI.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'total_pages': totalPages,
      'results': results?.map((v) => v.toJson()).toList(),
    };
  }
}

class Result {
  String? id;
  String? description;
  String? altDescription;
  Urls? urls;
  User? user;

  Result(
      {this.id, this.description, this.altDescription, this.urls, this.user});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? Urls.fromJson(json['urls']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'alt_description': altDescription,
      'urls': urls?.toJson(),
      'user': user?.toJson(),
    };
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;

  Urls({this.raw, this.full, this.regular, this.small, this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    return {
      'raw': raw,
      'full': full,
      'regular': regular,
      'small': small,
      'thumb': thumb,
    };
  }
}

class User {
  String? id;
  String? username;
  String? name;
  ProfileImage? profileImage;

  User({this.id, this.username, this.name, this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    profileImage = json['profile_image'] != null
        ? ProfileImage.fromJson(json['profile_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'profile_image': profileImage?.toJson(),
    };
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    return {
      'small': small,
      'medium': medium,
      'large': large,
    };
  }
}
