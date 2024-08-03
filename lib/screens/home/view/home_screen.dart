import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/view/scroll1.dart';
import 'package:flutter_application_1/screens/map.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          automaticallyImplyLeading: false, // 기본 뒤로가기 버튼 숨기기
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 35,
              ),
            ),
          ],
          flexibleSpace: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 200,
                  height: 100,
                  child: Image.asset('assets/firstlogo.png'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Cardscrol(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage()));
                        },
                        child: SizedBox(
                            height: 60,
                            width: 50,
                            child: Image.asset('assets/bob.png'))),
                    TextButton(
                        onPressed: () {},
                        child: SizedBox(
                            height: 60,
                            width: 50,
                            child: Image.asset('assets/display.png'))),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage()));
                        },
                        child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Image.asset('assets/cafe1.png'))),
                    TextButton(
                        onPressed: () {},
                        child: SizedBox(
                            height: 70,
                            width: 60,
                            child: Image.asset('assets/play.png'))),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage()));
                        },
                        child: SizedBox(
                            height: 70,
                            width: 40,
                            child: Image.asset('assets/park.png'))),
                    TextButton(
                        onPressed: () {},
                        child: SizedBox(
                            height: 60,
                            width: 50,
                            child: Image.asset('assets/all.png'))),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
