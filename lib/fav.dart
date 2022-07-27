import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// importing dependencies
// void main() => runApp(MyApp());

// inictating app build
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primaryColor: Colors.green),
//       home: RandWords(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class RandWords extends StatefulWidget {
  const RandWords({Key? key}) : super(key: key);

  @override
  RandWordsState createState() => RandWordsState();
}

class RandWordsState extends State<RandWords> {
  final _randomWordPairs = <WordPair>[];
  final _addWordPairs = Set<WordPair>();

  Widget buildList() => ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isEven) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );

  Widget _buildRow(WordPair pair) {
    final alreadyadd = _addWordPairs.contains(pair);

    // word-pair tile
    return Card(
      child: ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
        subtitle: Text('Hello'),
        leading: const CircleAvatar(
            backgroundImage: const NetworkImage(
                "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
        trailing: IconButton(
          onPressed: () {
            setState(() {
              if (alreadyadd) {
                _addWordPairs.remove(pair);
              } else {
                _addWordPairs.add(pair);
              }
            });
          },
          icon: Icon(alreadyadd ? Icons.check : Icons.add,
              color: alreadyadd ? Colors.green : null),
        ),
      ),
    );
    ListTile(
        trailing: Icon(alreadyadd ? Icons.check : Icons.add,
            color: alreadyadd ? Colors.green : null),
        onTap: () {
          setState(() {
            if (alreadyadd) {
              _addWordPairs.remove(pair);
            } else {
              _addWordPairs.add(pair);
            }
          });
        });
  }

  pushadd() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        final Iterable<ListTile> tiles = _addWordPairs.map((WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: const TextStyle(fontSize: 16.0),
            ),
          );
        });

        final List<Widget> divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();

        // saved word-pair page
        return Scaffold(
          appBar: AppBar(title: const Text('Saved Word-Pairs')),
          body: ListView(children: divided),
        );
      }),
    );
  }

// home page
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: Container(
        child: IconButton(onPressed: pushadd, icon: Icon(Icons.add)),
        color: Colors.amber,
      ),
      body: buildList());
}
