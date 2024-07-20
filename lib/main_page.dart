
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
        title: Text('TimeMinder'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
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
                        // Adjusted image height and alignment
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
                  // Adjusted position of the button
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