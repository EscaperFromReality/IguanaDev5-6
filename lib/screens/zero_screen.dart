import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled/main.dart';

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
          'First Screen',
        ),
      ),
        body: Center(
            child: SizedBox(
                width: 400, height: 90,
                child: cp.whatIsThatInterface() ? const Column(
                  children:  [
                    SizedBox( height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Running Web')
                      ],
                    ),
                    SizedBox( height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          () => context.go('/FirstScreen');
                        }, child: const Text('Run App'),
                        ),
                      ],
                    ),
                  ],
                ) :
                Column(
                  children: [const SizedBox( height: 30),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Running Desktop')
                      ],
                    ),
                    const SizedBox( height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(onPressed: (){
                          () => context.go('/FourthScreen');
                        }, child: const Text('Run App')),
                      ],
                    ),
                  ],
                )
            )
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}