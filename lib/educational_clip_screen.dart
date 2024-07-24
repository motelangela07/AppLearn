import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class EducationalClipScreen extends StatefulWidget {
  @override
  _EducationalClipScreenState createState() => _EducationalClipScreenState();
}

class _EducationalClipScreenState extends State<EducationalClipScreen> {
  final List<Map<String, String>> videoClips = [
    {'title': 'About Time Management', 'videoPath': 'assets/clip1.mp4'},
    {
      'title': '10 Time Management Tips to Boost Your Productivity',
      'videoPath': 'assets/clip2.mp4'
    },
    {
      'title':
          'The Eisenhower matrix: How to manage your tasks with EISENHOWER',
      'videoPath': 'assets/clip3.mp4'
    },
    {
      'title': 'How to manage your time more effectively',
      'videoPath': 'assets/clip4.mp4'
    },
    {
      'title': 'Two 2-minute Rules to Beat Procrastination',
      'videoPath': 'assets/clip5.mp4'
    },
  ];

  late List<ChewieController> _chewieControllers;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayers();
  }

  Future<void> _initializeVideoPlayers() async {
    _chewieControllers = await Future.wait(
      videoClips.map((clip) async {
        final videoPlayerController =
            VideoPlayerController.asset(clip['videoPath']!)
              ..initialize().then((_) {
                setState(() {});
              });
        return ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: 16 / 9,
          autoPlay: false,
          looping: false,
          showControls: true,
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    for (var controller in _chewieControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Clips'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 96, 171, 233), // Blue color
              Color.fromARGB(255, 233, 132, 166), // Pink color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: videoClips.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _chewieControllers.isNotEmpty &&
                          _chewieControllers[index]
                              .videoPlayerController
                              .value
                              .isInitialized
                      ? Chewie(controller: _chewieControllers[index])
                      : Center(child: CircularProgressIndicator()),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    videoClips[index]['title']!,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Text color for consistency
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1.0,
                  height: 20.0,
                  indent: 16.0,
                  endIndent: 16.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EducationalClipScreen(),
  ));
}
