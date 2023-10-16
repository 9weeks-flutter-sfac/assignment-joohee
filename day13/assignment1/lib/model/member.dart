// ignore_for_file: public_member_api_docs, sort_constructors_first
class Member {
  String name;
  String area;
  MBTI? mbti;
  int age;

  Member({
    required this.name,
    required this.area,
    required this.age,
    this.mbti,
  });

  Member.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        area = map["area"],
        age = map["age"],
        mbti = map["MBTI"];

  MBTI? stringToMBTI(String mbti) {
    switch (mbti) {
      case "INFP":
        return MBTI.INFP;
      case "INFJ":
        return MBTI.INFJ;
      case "INTP":
        return MBTI.INTP;
      case "INTJ":
        return MBTI.INTJ;
      case "ISFP":
        return MBTI.ISFP;
      case "ISFJ":
        return MBTI.ISFJ;
      case "ISTP":
        return MBTI.ISTP;
      case "ISTJ":
        return MBTI.ISTJ;
      case "ENFP":
        return MBTI.ENFP;
      case "ENFJ":
        return MBTI.ENFJ;
      case "ENTP":
        return MBTI.ENTP;
      case "ENTJ":
        return MBTI.ENTJ;
      case "ESFP":
        return MBTI.ESFP;
      case "ESFJ":
        return MBTI.ESFJ;
      case "ESTP":
        return MBTI.ESTP;
      case "ESTJ":
        return MBTI.ESTJ;
      default:
        return null;
    }
  }
}

enum MBTI {
  INFP,
  INFJ,
  INTP,
  INTJ,
  ISFP,
  ISFJ,
  ISTP,
  ISTJ,
  ENFP,
  ENFJ,
  ENTP,
  ENTJ,
  ESFP,
  ESFJ,
  ESTP,
  ESTJ,
}
