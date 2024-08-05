import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/home/view/Rating.dart';
import 'package:flutter_application_1/screens/home/view/Rere.dart';

class ReviewPage1 extends StatefulWidget {
  @override
  _ReviewPage1State createState() => _ReviewPage1State();
}

class _ReviewPage1State extends State<ReviewPage1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/gungun.png'),
            ),
            SizedBox(
              width: 40,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Rating1()));
                  },
                  child: Image.asset('assets/rating1.png')),
            ),
          ],
        ),
        Expanded(
          child: ReviewList(),
        )
      ],
    );
  }
}
