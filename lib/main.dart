import 'package:flutter/material.dart';
import 'story_brain.dart';

StoryBrain storyBrain = StoryBrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image(
                  image: AssetImage('images/background.png'),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: StoryPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//=============================================

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

//========================================================
class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                storyBrain.getStory(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  storyBrain.nextStory(1);
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                storyBrain.getChoice1(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  storyBrain.nextStory(2);
                });
              },
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                storyBrain.getChoice2(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
