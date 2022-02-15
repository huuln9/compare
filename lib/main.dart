import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Item> _data = generateItems(10);
  final List<Item> _data2 = generateItems2(10);

  Widget _buildListPanel() {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _data[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: _data.map((item) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(title: Text(item.headerValue));
          },
          body: Column(
            children: [
              for (var e in _data2)
                ListTile(
                  title: Text(e.expandedValue),
                  onTap: () {
                    setState(() {
                      _data.removeWhere((element) => item == element);
                    });
                  },
                  trailing: const Icon(Icons.phone_callback_rounded),
                ),
            ],
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Danh bạ khẩn cấp')),
      body: SingleChildScrollView(child: _buildListPanel()),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.isExpanded,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item(
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index',
        isExpanded: true);
  });
}

List<Item> generateItems2(int numberOfItems) {
  return List.generate(numberOfItems, (index) {
    return Item(
        headerValue: 'detail $index',
        expandedValue: 'detail This is item number $index',
        isExpanded: true);
  });
}
