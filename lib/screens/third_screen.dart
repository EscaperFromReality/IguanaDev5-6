import 'package:flutter/material.dart';
import 'package:untitled/screens/first_screen.dart';
import 'package:untitled/screens/second_screen.dart';
import 'dart:math';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.title});  final String title;  @override  State<ThirdScreen> createState() => _ThirdScreenState();}

class _ThirdScreenState extends State<ThirdScreen> {

  int currentPageIndex = 0;

  final listViewSeparatedItems = List.generate(1, (index) => 'Line ${index + 1}');

  get index => 10;

  void addLine() {
    setState(() {
      listViewSeparatedItems.add('Line ${index + 1}');
    });
  }
  void deleteListViewSeparatedItem(int index){
    setState(() {
      listViewSeparatedItems.removeAt(index);
    });
  }
  Future<bool> getRandomValue() {
    return Future.delayed(const Duration(seconds: 3), () => Random().nextBool());
  }
  Future<void> saveLine() async {
    /*setState(() {
      listViewSeparatedItems.add("///");
    });*/
    bool result = await getRandomValue();
    setState(() {
      if (result)
        listViewSeparatedItems.add("Success");
      else
        listViewSeparatedItems.add("Fail");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Third Screen',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addLine,
        tooltip: 'Add Line',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: SizedBox(
            height: 1920, width: 1080,
          child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                MaterialPageRoute(builder: (context) => const SecondScreen(title: '',));
              },
              child: const Text('To Second Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const FirstScreen(title: '',)),
                );
              },
              child: const Text('To First Screen'),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Card(
                    child: ListTile(
                      title: Text(listViewSeparatedItems[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => saveLine(),
                      ),
                    )
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: listViewSeparatedItems.length,
            ),
          ],
        ),
      ),
    ));
  }
}