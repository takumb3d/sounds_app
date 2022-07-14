import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AudioPlayer _audioPlayer;

  List<String> _texts = ["おめでとう", "エクセレント", "不合格です", "大外れ～", "当ったり～", "頑張ったね"];

  List<String> _soundPaths = [
    "assets/sounds/「おめでとう」.mp3",
    "assets/sounds/「エクセレント」.mp3",
    "assets/sounds/「不合格です」.mp3",
    "assets/sounds/「大外れ～」.mp3",
    "assets/sounds/「当ったり～」.mp3",
    "assets/sounds/「頑張ったね」.mp3",
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sounds"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1, child: _soundbutton(_texts[0], _soundPaths[0]),
                  ),
                  Expanded(
                    flex: 1, child: _soundbutton(_texts[1], _soundPaths[1]),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1, child: _soundbutton(_texts[2], _soundPaths[2]),
                  ),
                  Expanded(
                    flex: 1, child: _soundbutton(_texts[3], _soundPaths[3]),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1, child: _soundbutton(_texts[4], _soundPaths[4]),
                  ),
                  Expanded(
                    flex: 1, child: _soundbutton(_texts[5], _soundPaths[5]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _soundbutton(String displayText, String soundPath) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: ElevatedButton(onPressed: () => _playSound(soundPath),
          child: Text(displayText)
      ),
    );
  }

  _playSound(String soundPath) async {
    await _audioPlayer.setAsset(soundPath);

  }
}

//114
