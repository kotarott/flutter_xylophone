import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Xylophone'),
          backgroundColor: Colors.blue,
        ),
        body: const SoundPage(),
      ),
    );
  }
}

class SoundPage extends StatelessWidget {
  const SoundPage({Key? key}) : super(key: key);

  void playSound(int fileNum) {
    final player = AudioPlayer();
    player.play(AssetSource('note$fileNum.wav'));
  }

  Expanded buildKey(int fileNum, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: (() {
          playSound(fileNum);
        }),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildKey(1, Colors.red),
        buildKey(2, Colors.orange),
        buildKey(3, Colors.yellow),
        buildKey(4, Colors.green),
        buildKey(5, Colors.teal),
        buildKey(6, Colors.blue),
        buildKey(7, Colors.purple),
      ],
    );
  }
}
