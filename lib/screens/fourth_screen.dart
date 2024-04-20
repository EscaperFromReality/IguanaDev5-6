import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key, required this.title});  final String title;  @override  State<FourthScreen> createState() => _FourthScreenState();}

class _FourthScreenState extends State<FourthScreen> {

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
          'Fourth Screen',
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
                    () => context.go('/ThirdScreen');
              },
              child: const Text('To Third Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                    () => context.go('/FifthScreen');
              },
              child: const Text('To Fifth Screen'),
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