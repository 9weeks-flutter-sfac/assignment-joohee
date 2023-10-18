import 'package:assignment1/model/profile.dart';
import 'package:assignment1/view/detail_page.dart';
import 'package:dio/dio.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Profile> profiles = [];
  var imgUrl = 'https://xsgames.co/randomusers/assets/avatars/male/';

  readData() async {
    Dio dio = Dio();
    var url = 'https://jsonplaceholder.typicode.com/users';
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      profiles = data.map((e) => Profile.fromMap(e)).toList();
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
          child: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) => FadeInRight(
          duration: Duration(milliseconds: 100 * index),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                '$imgUrl${profiles[index].id}.jpg',
              ),
            ),
            title: Text(profiles[index].name),
            subtitle: Text(profiles[index].email),
            trailing: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(profile: profiles[index]),
                    ));
              },
            ),
          ),
        ),
      )),
    );
  }
}
