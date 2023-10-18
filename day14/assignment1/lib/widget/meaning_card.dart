// ignore_for_file: prefer_const_constructors

import 'package:assignment1/model/meaning.dart';
import 'package:flutter/material.dart';

class MeaningCard extends StatelessWidget {
  const MeaningCard({super.key, required this.meaning});
  final Meaning meaning;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meaning.partOfSpeech,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              ' - Synonyms: ',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: meaning.synonyms
                    .map((e) => Text(
                          e,
                          style: TextStyle(color: Colors.white60),
                        ))
                    .toList(),
              ),
            ),
            Text(
              ' - Definitions: ',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: meaning.definitions
                    .map((e) => Text(
                          e.definition,
                          style: TextStyle(color: Colors.white60),
                        ))
                    .toList(),
              ),
            ),
            Text(
              ' - Antonyms: ',
              style: TextStyle(fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: meaning.antonyms
                    .map((e) => Text(
                          e,
                          style: TextStyle(color: Colors.white60),
                        ))
                    .toList(),
              ),
            ),
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemCount: meaning.definitions.length,
            //   itemBuilder: (context, index) {
            //     return Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             meaning.definitions[index].definition,
            //             style: TextStyle(color: Colors.white54),
            //           ),
            //         ]);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
