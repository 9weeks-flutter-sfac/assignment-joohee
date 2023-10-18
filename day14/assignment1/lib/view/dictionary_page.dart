// ignore_for_file: prefer_const_constructors

import 'package:assignment1/model/dictionary.dart';
import 'package:assignment1/widget/dict_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  String? input;
  // Dictionary? dictionary;
  List<Dictionary>? dictionaries;
  var textFieldController = TextEditingController();

  readData(String str) async {
    Dio dio = Dio();
    try {
      var res = await dio
          .get('https://api.dictionaryapi.dev/api/v2/entries/en/${str}');
      if (res.statusCode == 200) {
        var data = List<Map<String, dynamic>>.from(res.data);
        dictionaries = data.map((e) => Dictionary.fromMap(e)).toList();
        setState(() {});
      }
    } catch (e) {
      dictionaries = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary App'),
        elevation: 0,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textFieldController,
                onSubmitted: (value) {
                  readData(value);
                  // setState(() {});
                },
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  suffixIconColor: Colors.white,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: 'search',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      readData(textFieldController.text);
                    },
                  ),
                ),
              ),
            ),
            if (dictionaries != null) Divider(),
            if (dictionaries != null)
              Expanded(
                  child: ListView.builder(
                shrinkWrap: true,
                itemCount: dictionaries!.length,
                itemBuilder: (context, index) {
                  return DictCard(dictionary: dictionaries![index]);
                },
              ))
            // SingleChildScrollView(
            //     child: DictCard(dictionary: dictionaries!))),
          ]),
    );
  }
}
