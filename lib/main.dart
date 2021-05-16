import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key key}) : super(key: key);

  void playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Expanded buildKey(Color color, int note, String key) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(note);
        },
        child: Text(
          '$key',
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.music_note),
                  Text(
                    'Xylophone App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Icon(Icons.music_note),
                ],
              )
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1, "1"),
              buildKey(Colors.blue, 2, "2"),
              buildKey(Colors.yellow, 3, "3"),
              buildKey(Colors.green, 4, "4"),
              buildKey(Colors.teal, 5, "5"),
              buildKey(Colors.purple, 6, "6"),
              buildKey(Colors.orange, 7, "7"),
            ],
          ),
        ),
      ),
    );
  }
}
