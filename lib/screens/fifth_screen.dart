import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({super.key, required this.title});  final String title;  @override  State<FifthScreen> createState() => _FifthScreenState();}

class _FifthScreenState extends State<FifthScreen> {

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
          'Fifth Screen',
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
                    () => context.go('/FirstScreen');
              },
              child: const Text('To First Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                    () => context.go('/FourthScreen');
              },
              child: const Text('To Fourth Screen'),
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