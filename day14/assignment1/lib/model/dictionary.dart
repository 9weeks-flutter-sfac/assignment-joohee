// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assignment1/model/meaning.dart';

class Dictionary {
  String word;
  List<Meaning> meanings;

  Dictionary({required this.word, required this.meanings});

  factory Dictionary.fromMap(Map<String, dynamic> map) {
    return Dictionary(
        word: map["word"],
        meanings: List<Meaning>.from(
            map["meanings"].map((e) => Meaning.fromMap(e)).toList()));
  }

  @override
  String toString() => 'Dictionary(word: $word, meanings: $meanings)';
}
