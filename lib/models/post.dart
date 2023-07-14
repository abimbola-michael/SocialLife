// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Post {
  String name;
  String img;
  String postImg;
  String time;
  String like;
  String comment;
  String share;
  Post({
    required this.name,
    required this.img,
    required this.postImg,
    required this.time,
    required this.like,
    required this.comment,
    required this.share,
  });

  Post copyWith({
    String? name,
    String? img,
    String? postImg,
    String? time,
    String? like,
    String? comment,
    String? share,
  }) {
    return Post(
      name: name ?? this.name,
      img: img ?? this.img,
      postImg: postImg ?? this.postImg,
      time: time ?? this.time,
      like: like ?? this.like,
      comment: comment ?? this.comment,
      share: share ?? this.share,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
      'postImg': postImg,
      'time': time,
      'like': like,
      'comment': comment,
      'share': share,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      name: (map["name"] ?? '') as String,
      img: (map["img"] ?? '') as String,
      postImg: (map["postImg"] ?? '') as String,
      time: (map["time"] ?? '') as String,
      like: (map["like"] ?? '') as String,
      comment: (map["comment"] ?? '') as String,
      share: (map["share"] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(name: $name, img: $img, postImg: $postImg, time: $time, like: $like, comment: $comment, share: $share)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.img == img &&
        other.postImg == postImg &&
        other.time == time &&
        other.like == like &&
        other.comment == comment &&
        other.share == share;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        img.hashCode ^
        postImg.hashCode ^
        time.hashCode ^
        like.hashCode ^
        comment.hashCode ^
        share.hashCode;
  }
}
