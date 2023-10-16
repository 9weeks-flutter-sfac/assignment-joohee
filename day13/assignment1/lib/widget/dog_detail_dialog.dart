import 'package:assignment1/model/dog.dart';
import 'package:flutter/material.dart';

class DogDetailDioalog extends StatelessWidget {
  const DogDetailDioalog({super.key, required this.dog});
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior:
            Clip.antiAlias, // 위쪽 모퉁이, 사진에 BorderRadius.circular 적용 안되는 것 해결
        child: Column(
          mainAxisSize: MainAxisSize.min, //위에 붙어있던 사진을 center로
          children: [
            Image.network(dog.message),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close')),
          ],
        ),
      ),
    );
  }
}
