import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/first_screen.dart';
import 'package:untitled/screens/fourth_screen.dart';

class ZeroScreen extends StatefulWidget {
  const ZeroScreen({super.key, required this.title});  final String title;  @override  State<ZeroScreen> createState() => _ZeroScreenState();}

class _ZeroScreenState extends State<ZeroScreen> {
  Crossplatformer cp = Crossplatformer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Zero Screen',
        ),
      ),
        body: Center(
            child: SizedBox(
                width: 600, height: 120,
                child: cp.whatIsThatInterface() ? Column(
                  children:  [
                    const SizedBox( height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Running Web')
                      ],
                    ),
                    const SizedBox( height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FirstScreen(title: '',)));
                        }, child: const Text('Run Web App'),
                        ),
                      ],
                    ),
                  ],
                ) :
                Column(
                  children: [const SizedBox( height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Running Desktop')
                      ],
                    ),
                    const SizedBox( height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const FourthScreen(title: '',)));
                        }, child: const Text('Run Desktop App')),
                      ],
                    ),
                  ],
                )
            )
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}