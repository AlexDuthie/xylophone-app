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

  void playSong() async {
    List<int> notes = [
      1, 1, 5, 5, 6, 6, 5, 4, 4, 3, 3, 2, 2, 1,
      5, 5, 4, 3, 3, 2, 5, 5, 4, 3, 3, 2,
      1, 1, 5, 5, 6, 6, 5, 4, 4, 3, 3, 2, 2, 1
    ];
    // notes.add(1);
    // notes.add(2);
    // notes.add(3);

    for (int i = 0; i < notes.length; i++) {
      playSound(notes[i]);
      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  Expanded buildKey(String key, Color color, int note) {
    return Expanded(
      key: Key(key),
      child: TextButton(
        child: null,
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(note);
        },
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
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: (){
                      playSong();
                    },
                    child: Text(
                      'Click Me',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
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
              buildKey("1", Colors.red, 1),
              buildKey("2", Colors.blue, 2),
              buildKey("3", Colors.yellow, 3),
              buildKey("4", Colors.green, 4),
              buildKey("5", Colors.teal, 5),
              buildKey("6", Colors.purple, 6),
              buildKey("7", Colors.orange, 7),
            ],
          ),
        ),
      ),
    );
  }
}
