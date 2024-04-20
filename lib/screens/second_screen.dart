import 'package:flutter/material.dart';
import 'package:untitled/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title});  final String title;  @override  State<SecondScreen> createState() => _SecondScreenState();}

class _SecondScreenState extends State<SecondScreen> {

  int currentPageIndex = 0;
  final listViewItems = List.generate(10, (index) => 'Line ${index + 1}');

  get index => 10;

  void addLine() {
    setState(() {
      listViewItems.add('Line ${index + 1}');
    });
  }
  void deleteListViewItem(int index){
    setState(() {
      listViewItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Second Screen',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addLine,
        tooltip: 'Add Line',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                Navigator.pop(context);
              },
              child: const Text('To First Screen'),
            ),
            ListView(
                shrinkWrap: true,
                children: [
                  for (int i = 0; i < listViewItems.length; i++)
                    Card(
                        child: ListTile(
                          title: Text(listViewItems[i]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => deleteListViewItem(i),
                          ),
                        )
                    )
                ]
            ),
          ],
        ),
      ),
    );
  }
}