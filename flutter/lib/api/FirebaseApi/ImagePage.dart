import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixie/api/FirebaseApi/FirebaseApi.dart';
import 'package:pixie/api/FirebaseApi/FirebaseFile.dart';
import 'package:video_player/video_player.dart';

class ImagePage extends StatefulWidget {
  final FirebaseFile file;

  const ImagePage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _VideoPlayer createState() => _VideoPlayer(file: file);
}

class _VideoPlayer extends State<ImagePage> {
  final FirebaseFile file;

  _VideoPlayer({
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    File video =
        new File("/data/user/0/com.pixie.android/app_flutter/${file.name}");
    VideoPlayerController _controller = VideoPlayerController.network(file.url);
    Future<void> _initializeVideoPlayerFuture = _controller.initialize();

    return Scaffold(
        appBar: AppBar(
          title: Text(file.name),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.copy),
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: file.url));
                final snackBar = SnackBar(
                  content: Text('URL이 복사되었습니다.'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () async {
                await FirebaseApi.downloadFile(file.ref);

                final snackBar = SnackBar(
                  content: Text('Downloaded ${file.name}'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
            const SizedBox(width: 12),
          ],
        ),
        body: Container(
          child: Stack(alignment: Alignment.topCenter, children: <Widget>[
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller)),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Center(
                child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ))
          ]),
        ));
  }
}
