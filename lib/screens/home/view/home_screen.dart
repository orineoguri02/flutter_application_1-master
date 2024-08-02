import 'package:flutter/material.dart';
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 35,
            )),
        title: Text('TYPE'),
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
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/firstlogo.png'),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MapPage()));
                    },
                    child: Text('식당')),
                TextButton(onPressed: () {}, child: Text('카페')),
                TextButton(onPressed: () {}, child: Text('놀거리')),
                TextButton(onPressed: () {}, child: Text('공연')),
                TextButton(onPressed: () {}, child: Text('몰라'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
