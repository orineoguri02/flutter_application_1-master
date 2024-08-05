import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewPage1 extends StatefulWidget {
  @override
  _ReviewPage1State createState() => _ReviewPage1State();
}

class _ReviewPage1State extends State<ReviewPage1> {
  final TextEditingController _reviewController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _submitReview() {
    if (_reviewController.text.isNotEmpty) {
      _firestore.collection('reviews').add({
        'review': _reviewController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _reviewController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection('reviews')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              final reviews = snapshot.data!.docs;

              return ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(reviews[index]['review']),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _reviewController,
                  decoration: InputDecoration(labelText: '리뷰를 작성하세요'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _submitReview,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
