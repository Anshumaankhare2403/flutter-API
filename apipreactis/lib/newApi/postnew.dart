// class PostNew {
//   int? postId;
//   int? id;
//   String? name;
//   String? email;
//   String? body;

//   PostNew({this.postId, this.id, this.name, this.email, this.body});

//   PostNew.fromJson(Map<String, dynamic> json) {
//     postId = json['postId'];
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     body = json['body'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['postId'] = this.postId;
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['body'] = this.body;
//     return data;
//   }
// }

class PostNew {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  PostNew({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  PostNew.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
