import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sound player', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body: const SafeArea(
            child: Center(
          child: SoundPlayer(),
        )),
      ),
    );
  }
}

class SoundPlayer extends StatefulWidget {
  const SoundPlayer({super.key});

  @override
  State<SoundPlayer> createState() => _SoundPlayerState();
}

class _SoundPlayerState extends State<SoundPlayer> {
  final player = AudioPlayer();
  // await player.setSource(AssetSource('sounds/coin.wav'));

  void playSound(int soundNum) {
    // await player.setSource(AssetSource('note1.wav'));
    // await player.resume();
    player.play(AssetSource('note$soundNum.wav'));
  }

  Widget buildKey(Color color, int widgetNum) {
    return Expanded(
      child: TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: () {
            playSound(widgetNum);
          },
          child: Container(
            color: color,
            width: MediaQuery.of(context).size.width,
          )),
    );
  }

  List buttonsList() {
    var colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.greenAccent,
      Colors.blue,
      Colors.pink
    ];
    var arr = [];
    for (int i = 0; i < 7; i++) {
      arr.add(buildKey(colors[i], i));
    }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [...buttonsList()],
      ),
    );
  }
}
