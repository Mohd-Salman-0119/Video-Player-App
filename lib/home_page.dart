import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app_new/app_layout.dart';
import 'package:video_player_app_new/video_info.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initState() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: color.AppColors.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(
            top: AppLayout.getHeight(70),
            left: AppLayout.getHeight(30),
            right: AppLayout.getHeight(30)),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Traning',
                  style: TextStyle(
                      color: color.AppColors.homePageTitle,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                const Icon(Icons.arrow_back_ios, size: 20),
                SizedBox(width: AppLayout.getWidth(10)),
                const Icon(Icons.calendar_today_outlined, size: 20),
                SizedBox(width: AppLayout.getWidth(10)),
                const Icon(Icons.arrow_forward_ios, size: 20),
              ],
            ),
            SizedBox(height: AppLayout.getHeight(30)),
            Row(
              children: [
                Text(
                  'Your program',
                  style: TextStyle(
                      color: color.AppColors.homePageSubTitle,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () => Get.to(const VideoInfo()),
                  child: Row(
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                          color: color.AppColors.homePageDetails,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: AppLayout.getWidth(5)),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: color.AppColors.homePageIcons,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppLayout.getWidth(20)),
            Container(
              width: MediaQuery.of(context).size.width,
              height: AppLayout.getHeight(220),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  color.AppColors.gradientFirst.withOpacity(0.8),
                  color.AppColors.gradientSecond.withOpacity(0.9),
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5, 10),
                      blurRadius: 5,
                      color: color.AppColors.gradientSecond.withOpacity(0.2))
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 25, left: 20, right: 20, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next workout',
                      style: TextStyle(
                        color: color.AppColors.homePageContainerTextSmall,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: AppLayout.getWidth(5)),
                    Text(
                      'Legs Toning\nand Glutes Workout',
                      style: TextStyle(
                        color: color.AppColors.homePageContainerTextSmall,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: AppLayout.getWidth(5)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 20,
                              color: color.AppColors.homePageContainerTextSmall,
                            ),
                            SizedBox(
                              width: AppLayout.getWidth(10),
                            ),
                            Text(
                              '60 min',
                              style: TextStyle(
                                color:
                                    color.AppColors.homePageContainerTextSmall,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(4, 8),
                                    blurRadius: 10,
                                    color: color.AppColors.gradientFirst)
                              ]),
                          child: Icon(
                            Icons.play_circle_filled,
                            size: 60,
                            color: color.AppColors.homePageContainerTextSmall,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: AppLayout.getHeight(180),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: AppLayout.getHeight(120),
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/card.png",
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40,
                          offset: const Offset(8, 10),
                          color:
                              color.AppColors.gradientSecond.withOpacity(0.4),
                        ),
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(-1, -5),
                          color:
                              color.AppColors.gradientSecond.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: AppLayout.getHeight(200),
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 200, bottom: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/man_run.png",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: AppLayout.getHeight(100),
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('You are doing great',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: color.AppColors.homePageDetails)),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            text: 'keep it up\n',
                            style: TextStyle(
                                color: color.AppColors.homePagePlaneColor,
                                fontSize: 16),
                            children: const [
                              TextSpan(text: 'stick to your plane')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of foucs',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: color.AppColors.homePageTitle),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: info.length.toDouble() ~/ 2,
                  itemBuilder: (_, i) {
                    int a = 2 * i;
                    int b = 2 * i + 1;
                    return Row(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          height: AppLayout.getHeight(170),
                          margin: const EdgeInsets.only(
                              left: 30, bottom: 15, top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(info[a]['image']),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(5, 5),
                                color: color.AppColors.gradientSecond
                                    .withOpacity(0.1),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(-5, -5),
                                color: color.AppColors.gradientSecond
                                    .withOpacity(0.1),
                              )
                            ],
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[a]['title'],
                                style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColors.homePageDetails),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          height: AppLayout.getHeight(170),
                          margin: const EdgeInsets.only(
                              left: 30, bottom: 15, top: 15),
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(info[b]['image']),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(5, 5),
                                color: color.AppColors.gradientSecond
                                    .withOpacity(0.1),
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: const Offset(-5, -5),
                                color: color.AppColors.gradientSecond
                                    .withOpacity(0.1),
                              )
                            ],
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                info[b]['title'],
                                style: TextStyle(
                                  fontSize: 20,
                                  color: color.AppColors.homePageDetails,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
