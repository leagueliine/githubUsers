// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GithubUserModel {
  final String login;
  final String avatarUrl;
  final String? id;
  final String? url;

  GithubUserModel({
    required this.login,
    required this.avatarUrl,
    this.id,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatar_url': avatarUrl,
      'url': url,
      "id": id,
    };
  }

  factory GithubUserModel.fromMap(Map<String, dynamic> map) {
    return GithubUserModel(
      login: map['login'] as String,
      avatarUrl: map['avatar_url'] as String,
      url: map['url'] != null ? map['url'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubUserModel.fromJson(String source) =>
      GithubUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
