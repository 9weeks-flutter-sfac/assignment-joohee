// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String id;
  String collectionId;
  String collectionName;
  String created;
  String updated;
  String username;
  bool verified;
  bool emailVisibility;
  String? email;
  String name;
  String avatar;

  User(
      {required this.id,
      required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.updated,
      required this.username,
      required this.verified,
      required this.email,
      required this.emailVisibility,
      required this.name,
      required this.avatar});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'username': username,
      'verified': verified,
      'emailVisibility': emailVisibility,
      'email': email,
      'name': name,
      'avatar': avatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      updated: map['updated'] as String,
      username: map['username'] as String,
      verified: map['verified'] as bool,
      emailVisibility: map['emailVisibility'] as bool,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
