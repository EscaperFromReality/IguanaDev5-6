import 'package:flutter/material.dart';
import 'package:untitled/screens/second_screen.dart';
import 'package:untitled/screens/third_screen.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.title});  final String title;  @override  State<FirstScreen> createState() => _FirstScreenState();}

class _FirstScreenState extends State<FirstScreen> {

  int currentPageIndex = 0;

  final columnItems = List.generate(10, (index) => 'Line ${index + 1}');

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
              onPressed: () {
                    () => context.go('/FourthScreen');
              },
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
                    )
                ]
            ),
          ],
        ),
      ),
    ));
  }
}