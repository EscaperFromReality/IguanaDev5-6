import 'package:flutter/material.dart';
import 'package:untitled/screens/first_screen.dart';
import 'package:untitled/screens/second_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required this.title});  final String title;  @override  State<ThirdScreen> createState() => _ThirdScreenState();}

class _ThirdScreenState extends State<ThirdScreen> {

  int currentPageIndex = 0;

  final listViewSeparatedItems = List.generate(10, (index) => 'Line ${index + 1}');

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                        onPressed: () => deleteListViewSeparatedItem(index),
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
    );
  }
}