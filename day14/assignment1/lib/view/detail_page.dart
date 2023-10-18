import 'package:assignment1/model/profile.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(profile.name),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.network(
                'https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg',
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black45,
              ),
              Positioned(
                bottom: -48,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                        'https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name,
                style: TextStyle(fontSize: 32),
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Text(
                'Information',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    profile.phone,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.map),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    profile.address.street,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    profile.email,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Text(
                'Company',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                profile.company.name,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                profile.company.catchPhrase,
                style: TextStyle(fontSize: 16),
              ),
              Text(
                profile.company.bs,
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
