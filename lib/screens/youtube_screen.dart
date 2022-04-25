// import 'package:flutter/material.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
//
// class YoutubeScreen extends StatefulWidget {
//   final String urlVideo;
//
//   const YoutubeScreen({Key? key, required this.urlVideo}) : super(key: key);
//
//   @override
//   _YoutubeScreenState createState() => _YoutubeScreenState();
// }
//
// class _YoutubeScreenState extends State<YoutubeScreen> {
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     _controller = YoutubePlayerController(
//         initialVideoId:
//             YoutubePlayerController.convertUrlToId(widget.urlVideo)!,
//         params: const YoutubePlayerParams(
//           autoPlay: true,
//           loop: true,
//           color: 'transperant',
//           desktopMode: true,
//           strictRelatedVideos: true,
//           showFullscreenButton: true,
//         ));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      body : SizedBox(
//         height: 250,
//         width: 250,
//         child: YoutubePlayerControllerProvider(
//           controller: _controller,
//           child: YoutubePlayerIFrame(
//             controller: _controller,
//           ),
//         ),
//       ),
//     );
//   }
// }
