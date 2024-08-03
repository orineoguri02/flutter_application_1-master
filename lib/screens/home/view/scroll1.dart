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
        height: 400,
        width: 400,
        // 카드 스크롤의 높이를 설정
        child: ListView(scrollDirection: Axis.horizontal, children: [
          Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Expanded(child: Image.asset('assets/test1.png'))),
            ),
          ),
          Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/test1.png')),
            ),
          ),
          Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/test1.png')),
            ),
          ),
          Container(
            width: 400,
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset('assets/test1.png')),
            ),
          ),
        ]));
  }
}
