import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Secret {
  String id;
  String collectionId;
  String collectionName;
  String created;
  String updated;
  String secret;
  String author;
  String authorName;

  Secret({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.secret,
    required this.author,
    required this.authorName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'created': created,
      'updated': updated,
      'secret': secret,
      'author': author,
      'authorName': authorName,
    };
  }

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      id: map['id'] as String,
      collectionId: map['collectionId'] as String,
      collectionName: map['collectionName'] as String,
      created: map['created'] as String,
      updated: map['updated'] as String,
      secret: map['secret'] as String,
      author: map['author'] as String,
      authorName: map['authorName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Secret.fromJson(String source) =>
      Secret.fromMap(json.decode(source) as Map<String, dynamic>);
}
