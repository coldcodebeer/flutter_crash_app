import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordPairGenerator extends StatefulWidget {
  const WordPairGenerator({Key? key}) : super(key: key);

  @override
  _WordPairGeneratorState createState() => _WordPairGeneratorState();
}

class _WordPairGeneratorState extends State<WordPairGenerator> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(
        fontSize: 18.0,
      ),),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _savedWordPairs.remove(pair);
          } else {
            _savedWordPairs.add(pair);
          }
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, item) {
        if(item.isOdd) return Divider(thickness: 2,);

        final index = item ~/ 2;

        if(index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
            return ListTile(
              title: Text(
                pair.asPascalCase,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            );
          });

          final List<Widget> divided =
              ListTile.divideTiles(tiles: tiles, context: context).toList();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple[900],
              title: Text(
                'Saved Word Pairs'
              ),
            ),
            body: ListView(
              children: divided,
            ),
          );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text(
          'Word Pair Generator',
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved,),
        ],
      ),
      body: _buildList(),
    );
  }
}
