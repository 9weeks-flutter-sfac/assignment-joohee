// ignore_for_file: public_member_api_docs, sort_constructors_first
class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  Post.fromMap(Map<String, dynamic> map)
      : userId = map['userId'],
        id = map['id'],
        title = map['title'],
        body = map['body'];

  // String toString() {
  //   return 'Post(userId: $userId, id: $id, title: $title, body: $body)';
  // }
}
