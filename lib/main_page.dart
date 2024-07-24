import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'app_drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/time_management_video.mp4')
          ..initialize().then((_) {
            setState(() {});
          });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      aspectRatio: 16 / 9,
      autoPlay: false,
      looping: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/rbg.png', // Replace with the path to your image
              height: 40,
              width: 40,
            ),
            SizedBox(width: 5),
            Text(
              'TimeMinder',
              style: TextStyle(color: Colors.black), // Set text color to black
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 96, 171, 233), const Color.fromARGB(255, 233, 132, 166)], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: _videoPlayerController!.value.isInitialized
            ? Chewie(controller: _chewieController!)
            : Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/infog.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: FloatingActionButton(
                        onPressed: () {
                          _scrollController.animateTo(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Icon(Icons.keyboard_arrow_up, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}
