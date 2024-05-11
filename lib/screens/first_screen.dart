import 'package:flutter/material.dart';
import 'package:untitled/screens/second_screen.dart';
import 'package:untitled/screens/third_screen.dart';
import 'package:untitled/screens/fourth_screen.dart';
import 'package:go_router/go_router.dart';
import 'dart:math';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.title});  final String title;  @override  State<FirstScreen> createState() => _FirstScreenState();}

class _FirstScreenState extends State<FirstScreen> {

  int currentPageIndex = 0;

  final columnItems = List.generate(0, (index) => 'Line ${index + 1}');

  get index => 10;

  void addLine() {
    setState(() {
      columnItems.add('Line ${index + 1}');
    });
  }
  void deleteColumnItem(int index){
    setState(() {
      columnItems.removeAt(index);
    });
  }
  void fourthScreen(){
    context.go('/first_screen/fourth_screen');
  }
  void saveLine() {
    /*setState(() {
      columnItems.add("///");
    });*/
    Future<bool> messageFuture = getRandomValue();
    messageFuture.then((result){
      setState(() {
        if (result)
          columnItems.add("Success");
        else
          columnItems.add("Fail");
      });
    });
  }
  Future<bool> getRandomValue() {
    return Future.delayed(const Duration(seconds: 3), () => Random().nextBool());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'First Screen',
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen(title: '',)),
                );
              },
              child: const Text('To Second Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreen(title: '',)),
                );
              },
              child: const Text('To Third Screen'),
            ),
            ElevatedButton(
              onPressed: fourthScreen,
              child: const Text('To Fourth Screen'),
            ),
            Column(
                children: [
                  for (int i = 0; i < columnItems.length; i++)
                    Card(
                        child: ListTile(
                          title: Text(columnItems[i]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteColumnItem(i),
                          ),
                        )
                    ),
                    Card(
                        child: ListTile(
                          title: const Text('Get Bool Result'),
                          trailing: IconButton(
                            icon: const Icon(Icons.access_alarms),
                            onPressed: () => saveLine(),
                        ),
                      )
                  )
                ]
            ),
          ],
        ),
      ),
    ));
  }
}