import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/cutoms/itemList.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';
import 'package:flutter_states_widgets_routes/screens/AddLanguage.dart';

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
      initialRoute: "/",
      routes: {
        "/" : (context) => const MyHomePage(),
        "/add" : (context) => AddLanguage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

List<Language> languages = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Escolha de linguagens"),
        actions: [
          IconButton(
            onPressed: _goToNewLanguage, 
            icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Wrap(spacing: 10,children: buildChoices()),
          Expanded(child: ListView(children: buildListItens()))
        ],
       ), 
    );
  }

  void _goToNewLanguage(){
    Future future = Navigator.pushNamed(context, "/add");
    future.then((language) => {
      setState((){
        languages.add(language);
      })
    });
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
