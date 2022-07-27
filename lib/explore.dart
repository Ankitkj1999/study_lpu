import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  Function addCardToListMethod;
   ExploreScreen({Key? key, required this.addCardToListMethod}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListViewHome();
  }
}

class ListViewHome extends StatelessWidget {

  List<MyCardModel> myCardList = [
      MyCardModel(
               title: "List1",
               subtitle: "here is list 1 subtitle",
               leadingImage: "https://images.unsplash.com/photo-1547721064-da6cfb341d50" ),
         MyCardModel(
               title: "List1",
               subtitle: "here is list 1 subtitle",
               leadingImage: "https://images.unsplash.com/photo-1547721064- da6cfb341d50" )
 ];
  // final icons = [
  //   // IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
  //   // Icons.access_alarm,
  //   // Icons.access_time,
  //   Icons.add
  // ];

  ListViewHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myCardList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(myCardList[index].title),
              subtitle: Text(myCardList[index].subtitle),
              leading: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      myCardList[index].leadingImage)),
              trailing: IconButton(
                onPressed: () {
                      widget.addCardToListMethod(myCardList[index])},
                icon: const Icon(Icons.add),
              ),
            ),
          );          
        });
  }
}