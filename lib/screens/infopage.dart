import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Review.dart';
import 'package:flutter_application_1/screens/scroll2.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text(
                  '오뜨로 성수',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 4),
              Text(
                '서울특별시 성동구 뚝섬로1길 31 (성수동1가)',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 4),
              Image.asset(
                'assets/star1.png',
                height: 20,
                fit: BoxFit.contain,
              ),
            ],
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                  iconSize: 27,
                ),
                Text(
                  '찜하기',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/parking1.png', width: 60),
                  Image.asset('assets/wheelgo.png', width: 60),
                  Image.asset('assets/usewheel.png', width: 60),
                ],
              ),
              Scroll2(),
              const TabBar(
                tabs: [
                  Tab(text: '리뷰'),
                  Tab(text: '정보'),
                  Tab(text: '메뉴'),
                ],
              ),
              Container(
                height: 300,
                child: const TabBarView(
                  children: [
                    Center(child: Text('탭 2의 내용')),
                    Center(child: Text('탭 3의 내용')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
