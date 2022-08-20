import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/cutoms/itemList.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
List<bool> selects = [false, false, false, false, false, false];
List<Language> languages = [
  Language("Android Nativo", "Linguagens C, Java, Kotlin"),
  Language("Ionic", "Linguagens JavaScript e TypeScript"),
  Language("IOS", "Linguagens Objective C e Swift"),
  Language("Flutter", "Linguagem Dart"),
  Language("React Native", "Linguagens JavaScript e TypeScript"),
  Language("PWA", "Linguagens JavaScript e TypeScript")
];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha de linguagens"),
      ),
      body: Column(
        children: [
          Wrap(spacing: 10,children: buildChoices()),
          Expanded(child: ListView(children: buildListItens()))
        ],
       ), 
    );
  }

  List<Widget> buildChoices(){
    return languages.map((l) => ChoiceChip(
            label: Text(l.title),
            selected: l.selected,
            onSelected: (value){
              setState(() {
                l.selected = value;
              });
            })).toList();
  }

  List<Widget> buildListItens() {
    return languages
      .where((language) => language.selected)
      .map((l) => getItemList(l.title, l.subtitle, l.icon != null ? l.icon! : Icons.blur_circular))
      .toList();
  }
}
