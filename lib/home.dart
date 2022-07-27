 import 'package:firebase_auth/firebase_auth.dart';
    import 'package:flutter/material.dart';
    import 'package:study_lpu/explore.dart';
    import 'package:study_lpu/fav.dart';
    import 'login.dart';
    import 'explore.dart';
    

    class MyCardModel{
       String title;
       String subTitle;
       String leadingImage;

       MyCardModel(String title, String subTitle, String leadingImage) {
        this.title = title;
        this.subTitle = subTitle;
        this.leadingImage = leadingImage;
     }

    }
    class Home extends StatefulWidget {
      const Home({Key? key}) : super(key: key);
    
      @override
      _HomeState createState() => _HomeState();
    }
    
    class _HomeState extends State<Home> {
      late String uid;
      int _selectedIndex = 0;
      List<MyCardModel> listOfCard = [];

      void addCardToListMethod(MyCardModel card){
          setState((){
             listOfCard.add(card);
             })      
}
      static const List<Widget> _pages = <Widget>[
        // Scaffold(
        //   body: Center(
        //     child: Text('Hot'),
        //   ),
        // ),
        pushAdd(),
        ExploreScreen(addCardToListMethod: addCardToListMethod),
        RandWords(),
      ];
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                        (route) => false);
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book_outlined),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outlined),
                  label: 'Profile',
                )
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
            body:
                // Center(
                //   // child: Text(uid),
                //   child: _pages.elementAt(_selectedIndex),
                // ),
                IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ));
      }
    
      @override
      void initState() {
        // TODO: implement initState
        super.initState();
        uid = FirebaseAuth.instance.currentUser!.uid;
      }
    
      void _onItemTapped(int index) {
        setState(() {
          _selectedIndex = index;
        });
      }
    }

