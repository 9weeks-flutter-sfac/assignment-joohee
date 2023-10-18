import 'package:assignment1/model/dictionary.dart';
import 'package:assignment1/widget/meaning_card.dart';
import 'package:flutter/material.dart';

class DictCard extends StatelessWidget {
  const DictCard({super.key, required this.dictionary});
  final Dictionary dictionary;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dictionary.word,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dictionary.meanings.length,
              itemBuilder: (context, index) {
                return MeaningCard(meaning: dictionary.meanings[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
