import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app_new/app_layout.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool _playArea = false;
  List videoInfo = [];
  bool _isPlaying = false;
  bool _dispssed = false;
  int _isPlayingIndex = -1;

  VideoPlayerController? _controller;

  _initState() {
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  void dispose() {
    _dispssed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.AppColors.gradientFirst,
                    color.AppColors.gradientSecond,
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              )
            : BoxDecoration(color: color.AppColors.gradientSecond),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: size.width,
                    height: AppLayout.getHeight(330),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: color.AppColors.secondPageIconColor,
                                size: 20,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              color: color.AppColors.secondPageIconColor,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Legs Toning\nand Glutes Workout',
                          style: TextStyle(
                            color: color.AppColors.secondPageTitleColor,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            Container(
                              width: AppLayout.getWidth(90),
                              height: AppLayout.getHeight(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      color.AppColors
                                          .homePageContainerGradient1stColor
                                          .withOpacity(0.8),
                                      color.AppColors
                                          .homePageContainerGradient2stColor
                                          .withOpacity(0.9)
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 20,
                                    color: color.AppColors.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '68 min',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: color
                                            .AppColors.secondPageIconColor),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: AppLayout.getWidth(230),
                              height: AppLayout.getHeight(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    colors: [
                                      color.AppColors
                                          .homePageContainerGradient1stColor
                                          .withOpacity(0.8),
                                      color.AppColors
                                          .homePageContainerGradient2stColor
                                          .withOpacity(0.9)
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColors.secondPageIconColor,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Resistent band, kettebell',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: color
                                            .AppColors.secondPageIconColor),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        height: 100,
                        padding:
                            const EdgeInsets.only(top: 50, left: 30, right: 30),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColors.secondPageTopIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColors.secondPageTopIconColor,
                            ),
                          ],
                        ),
                      ),
                      _playView(context),
                      _controllerView(context),
                    ],
                  ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppLayout.getHeight(30),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                            fontSize: 20,
                            color: color.AppColors.circuitsColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              color: color.AppColors.loopColor,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                  color: color.AppColors.setsColor,
                                  fontSize: 15),
                            ),
                            const SizedBox(
                              width: 20,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: AppLayout.getHeight(20)),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  Widget _controllerView(BuildContext context) {
    final noMute = (_controller?.value.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: const RoundedRectSliderTrackShape(),
              trackHeight: 2.0,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
              thumbColor: Colors.redAccent,
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
              activeTickMarkColor: Colors.red[700],
              inactiveTickMarkColor: Colors.red[100],
              valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.redAccent,
              valueIndicatorTextStyle: const TextStyle(color: Colors.white)),
          child: Slider(
            value: max(0, min(progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              progress = value * 0.01;
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value.duration;
              if (duration != null) {
                var newValue = max(0, min(value, 99)) * 0.01;
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: AppLayout.getHeight(50),
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (noMute) {
                      _controller?.setVolume(0);
                    } else {
                      _controller?.setVolume(1.0);
                    }
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                        )
                      ],
                    ),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  // ignore: prefer_is_empty
                  if (index >= 0 && videoInfo.length >= 0) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar(
                      'Video',
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColors.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'No more ahead!',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videoInfo.length - 1) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar(
                      'Video List',
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: const Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColors.gradientSecond,
                      colorText: Colors.white,
                      messageText: const Text(
                        'You have watching all the videos, Congrats !',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Expanded(child: Container()),
              Text(
                "$mins : $secs",
                style: const TextStyle(color: Colors.white, shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 1.0),
                    blurRadius: 4.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  )
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: Text(
              'Preparing...',
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
          ));
    }
  }

  Duration? _duration;
  Duration? _position;
  var progress = 0.0;

  // ignore: prefer_typing_uninitialized_variables
  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    final controller = _controller;
    if (_dispssed) {
      return;
    }
    final now = DateTime.now().millisecondsSinceEpoch;
    _onUpdateControllerTime = 0;
    if (_onUpdateControllerTime > 0) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    if (controller == null) {
      debugPrint('controller is null');
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint('controller connot be initialized');
      return;
    }
    _duration ??= _controller?.value.duration;
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;

    if (playing) {
      if (_dispssed) return;
      setState(() {
        progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) {
    final controller =
        VideoPlayerController.asset(videoInfo[index]['videoUrl']);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }

    setState(() {});
    // ignore: avoid_single_cascade_in_expression_statements
    controller
      ..initialize().then((_) {
        old?.pause();
        _isPlayingIndex = index;
        controller.addListener(() {
          _onControllerUpdate;
        });
        controller.play();
        setState(() {});
      });
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getHeight(30),
          vertical: AppLayout.getHeight(8)),
      itemCount: videoInfo.length,
      itemBuilder: (_, index) {
        return GestureDetector(
            onTap: () {
              _initializeVideo(index);
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index));
      },
    );
  }

  _buildCard(int index) {
    return SizedBox(
      height: AppLayout.getHeight(135),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: AppLayout.getHeight(80),
                width: AppLayout.getWidth(80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                  image: DecorationImage(
                      image: AssetImage(
                        videoInfo[index]["thumbnail"],
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(
                width: AppLayout.getHeight(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      AppLayout.getHeight(3.0),
                    ),
                    child: Text(
                      videoInfo[index]['time'],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(height: AppLayout.getHeight(20)),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: AppLayout.getHeight(20),
                width: AppLayout.getWidth(80),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAEEFC),
                  borderRadius: BorderRadius.circular(
                    AppLayout.getHeight(10),
                  ),
                ),
                child: const Text(
                  '15s rest',
                  style: TextStyle(
                    color: Color(0XFF839FED),
                  ),
                ),
              ),
              for (int i = 1; i <= 70; i++)
                i.isEven
                    ? Container(
                        height: 1,
                        width: 3,
                        color: Colors.black,
                      )
                    : Container(
                        height: 1,
                        width: 3,
                        color: Colors.white,
                      ),
            ],
          ),
        ],
      ),
    );
  }
}
