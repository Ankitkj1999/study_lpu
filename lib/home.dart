import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

// class MyCardModel {
//   String title;
//   String subTitle;
//   String leadingImage;

//   MyCardModel(String title, String subTitle, String leadingImage) {
//     this.title = title;
//     this.subTitle = subTitle;
//     this.leadingImage = leadingImage;
//   }
// }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String uid;
  int _selectedIndex = 0;
  // List<MyCardModel> listOfCard = [];

  // void addCardToListMethod(MyCardModel card) {
  //   setState(() {
  //     listOfCard.add(card);
  //   });
  // }

  static const List<Widget> _pages = <Widget>[
    // Scaffold(
    //   body: Center(
    //     child: Text('Hot'),
    //   ),
    // ),
    // pushAdd(),
    // ExploreScreen(addCardToListMethod: addCardToListMethod),
    // RandWords(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Please give your confirmation!"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: const Text("Dismiss"),
                      ),
                    ),
                    // Logout Button
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        Future<bool> isAlreadyAuthenticated =
                            prefs.setBool('auth', false);
                        debugPrint(
                            'The initial value of isAlreadyAuthenticated $isAlreadyAuthenticated');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        child: const Text("Logout"),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
