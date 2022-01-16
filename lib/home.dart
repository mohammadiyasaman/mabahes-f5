import 'package:flutter/material.dart';
// بعد firebase
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      if (account != null) {
        print('user sign in!: $account');
        setState(() {
          isAuth = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScrean() : buildUnAuthScrean();
    // creat method
  }

  login() {
    googleSignIn.signIn();
  }

  logOut() {
    googleSignIn.signOut();
  }

  Widget buildAuthScrean() {
    return const Text("Authenticated");
  }

  Widget buildUnAuthScrean() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              // Theme.of(context).primaryColor,
              // Theme.of(context).canvasColor,

              Colors.teal,
              Colors.purple,

              // Colors.pink,
              // Colors.grey,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Splash Screan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 90,
                fontFamily: 'Honey',
              ),
            ),
            GestureDetector(
              onTap: () => login(),
              child: Container(
                width: 330.0,
                height: 80.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/googleSign.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
