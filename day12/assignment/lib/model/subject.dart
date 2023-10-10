class Subject {
  String subject;
  String explanation;
  String imgUrl;
  int price;

  Subject({
    required this.subject,
    required this.explanation,
    required this.imgUrl,
    required this.price,
  });

  Subject.fromMap(Map<String, dynamic> map)
      : subject = map["name"],
        explanation = map["description"],
        imgUrl = map["image"],
        price = map["price"];
}
