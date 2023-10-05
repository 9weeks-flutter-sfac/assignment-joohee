// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(fontFamily: 'neo'), //폰트 적용 안됨
      // themeMode: ThemeMode.system,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.PNG'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //image
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    BounceInDown(
                      duration: Duration(milliseconds: 1500),
                      child: Image.asset(
                        'assets/images/moon.PNG',
                        width: 220,
                      ),
                    ),
                    FadeIn(
                      delay: Duration(milliseconds: 1500),
                      duration: Duration(milliseconds: 1500),
                      child: Image.asset(
                        'assets/images/kiwi.PNG',
                        width: 150,
                      ),
                    ),
                  ],
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1500),
                duration: Duration(milliseconds: 1000),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    '달아,',
                    style: TextStyle(
                        color: Color.fromARGB(255, 245, 245, 203),
                        fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1500),
                duration: Duration(milliseconds: 1000),
                child: Text(
                  '너는 내 말을 들어주겠니?',
                  style: TextStyle(color: Colors.white60, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return SecretPage();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: FadeInDown(
                    from: 20,
                    delay: Duration(milliseconds: 2500),
                    child: ListTile(
                      leading: ClipOval(
                          child: Image.asset(
                        'assets/images/kiwiIcon.PNG',
                      )),
                      title: Text(
                        '오늘 밤에는 달이 휘영청 떴네요',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '비밀 보러가기',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color.fromARGB(209, 246, 246, 224)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return AuthorPage();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: FadeInDown(
                    from: 20,
                    delay: Duration(milliseconds: 3000),
                    child: ListTile(
                      leading: ClipOval(
                          child: Image.asset('assets/images/kiwiIcon.PNG')),
                      title: Text(
                        '달빛에 비춘 사람들이 있어요',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '작성자 보러가기',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color.fromARGB(209, 246, 246, 224)),
                      ),
                    ),
                  ),
                ),
              ),
              FadeInDown(
                from: 20,
                delay: Duration(milliseconds: 3500),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return UploadPage();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  leading: ClipOval(
                      child: Image.asset('assets/images/kiwiIcon.PNG')),
                  title: Text(
                    '달에게 비밀을 말해보아요',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    '비밀공유 하러가기',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Color.fromARGB(209, 246, 246, 224)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('뒤로가기'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.PNG'))),
        child: FutureBuilder(
          future: SecretCatApi.fetchSecrets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var secrets = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var secret = secrets[index];
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElasticIn(
                                  child: SizedBox(
                                    width: 80,
                                    child: ClipOval(
                                        child: Image.asset(
                                            'assets/images/kiwiIcon.PNG')),
                                  ),
                                ),
                                FadeInDown(
                                  delay: Duration(milliseconds: 500),
                                  from: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "내 비밀은 \n${secret.secret.toString()}\n이야",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              209, 246, 246, 224),
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                                ShakeX(
                                    child: Text(
                                  secret.author.toString(),
                                  style: TextStyle(
                                      color: Colors.white54, fontSize: 18),
                                )),
                              ]);
                        }),
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('뒤로가기'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/background.PNG'))),
          child: FutureBuilder(
            future: SecretCatApi.fetchAuthors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var authors = snapshot.data!;
                return GridView.builder(
                  itemCount: authors.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    var author = authors[index];
                    return Column(
                      children: [
                        BounceInDown(
                          delay: Duration(milliseconds: 250 * index),
                          child: Image.network(
                            author.avatar!,
                          ),
                        ),
                        FadeInUp(
                          delay: Duration(milliseconds: 250 * index),
                          from: 20,
                          child: Text(
                            author.username,
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      ],
                    );
                  },
                );
              }
              return SizedBox();
            },
          ),
        ));
  }
}

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  var textFieldController = TextEditingController();
  var isUploaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('뒤로가기'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.PNG'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textFieldController,
                style: TextStyle(color: Color.fromARGB(209, 246, 246, 224)),
                cursorColor: Color.fromARGB(209, 246, 246, 224),
                maxLines: 8,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(209, 246, 246, 224),
                            width: 2.0)),
                    labelText: '달에게 비밀을 말해보아요!',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none, // 외곽선 제거
                    ),
                    fillColor: Colors.white10,
                    filled: true,
                    labelStyle:
                        TextStyle(color: Color.fromARGB(209, 246, 246, 224))),
              ),
            ),
            InkWell(
              onTap: () {
                SecretCatApi.addSecret(textFieldController.text);
                isUploaded = true;
                setState(() {});
              },
              child: Image.asset(
                'assets/images/moon.PNG',
                width: 60,
              ),
            ),
            if (isUploaded == true)
              FadeIn(
                duration: Duration(milliseconds: 1000),
                child: Text(
                  '달에게 비밀이 전달됐어요:)',
                  style: TextStyle(color: Color.fromARGB(209, 246, 246, 224)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
