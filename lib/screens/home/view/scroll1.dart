import 'package:flutter/material.dart';

class Cardscrol extends StatefulWidget {
  const Cardscrol({super.key});

  @override
  State<Cardscrol> createState() => _CaedscrolState();
}

class _CaedscrolState extends State<Cardscrol> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: 350,
        // 카드 스크롤의 높이를 설정
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Container(
            width: 350,
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/ban1.png')),
            ),
          ),
          Container(
            width: 350,
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/ban2.png')),
            ),
          ),
          Container(
            width: 350,
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/ban3.png')),
            ),
          ),
          Container(
            width: 350,
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/ban4.png')),
            ),
          ),
        ]));
  }
}
