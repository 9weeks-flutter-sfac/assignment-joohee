class Meaning {
  String partOfSpeech;
  List<Definition> definitions;
  List<String> synonyms;
  List<String> antonyms;

  Meaning(
      {required this.partOfSpeech,
      required this.definitions,
      required this.synonyms,
      required this.antonyms});

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
        partOfSpeech: map["partOfSpeech"],
        definitions: List<Definition>.from(map["definitions"]
            .map((e) => Definition.fromMap(e))
            .toList()), //List<Dynamic> list->  List<Definition>
        synonyms: List<String>.from(map["synonyms"]),
        antonyms: List<String>.from(map["antonyms"]));
  }
}

class Definition {
  String definition;
  List<String> synonyms;
  List<String> antonyms;
  String? example;

  Definition(
      {required this.definition,
      required this.synonyms,
      required this.antonyms,
      required this.example});

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
        definition: map["definition"],
        synonyms: List<String>.from(map["synonyms"]),
        antonyms: List<String>.from(map["antonyms"]),
        example: map["example"]);
  }
}
