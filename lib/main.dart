import 'package:awesomewords/components/BigCard.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 34, 52, 255)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

    void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

     var favorites = <WordPair>[];

     void toggleFavorites(){
      if(favorites.contains(current)){
        favorites.remove(current);
      } else {
        favorites.add(current);
      }
     }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

return Scaffold(
  body: Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigCard(pair: pair),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => appState.getNext(),
          child: Text('Next'),
        ),
      ],
    ),
  ),
);
  }
}

