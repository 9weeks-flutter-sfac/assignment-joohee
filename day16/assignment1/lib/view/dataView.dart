import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/model/document.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataView extends GetView<MainController> {
  const DataView(this.docs, {super.key});

  final List<Document> docs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.documents.value!.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
                title: Text(docs[index].title),
                subtitle: Text(docs[index].content)),
            if (docs[index].attachment_url != null)
              Image.network(docs[index].attachment_url!),
            Divider(),
          ],
        );
      },
    );
  }
}
