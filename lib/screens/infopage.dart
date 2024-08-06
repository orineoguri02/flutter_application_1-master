import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/screens/Review.dart';
import 'package:flutter_application_1/screens/scroll2.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String? address; // 주소
  String? name; // 이름
  String? starImageUrl; // 별 이미지 URL
  List<String> imageUrls = []; // 이미지 URL 리스트

  @override
  void initState() {
    super.initState();
    fetchImages(); // 이미지 가져오기 호출
    fetchData();
  }

  Future<void> fetchImages() async {
    try {
      String folderPath = 'wheel/'; // Firebase Storage의 폴더 경로
      final ListResult result =
          await FirebaseStorage.instance.ref(folderPath).listAll();

      List<String> urls = [];
      for (var ref in result.items) {
        String url = await ref.getDownloadURL(); // 각 이미지의 URL 가져오기
        urls.add(url);
      }

      setState(() {
        imageUrls = urls; // 가져온 URL 리스트로 상태 업데이트
      });
    } catch (e) {
      print('Error fetching images: $e');
      setState(() {
        imageUrls = []; // 에러 발생 시 빈 리스트로 초기화
      });
    }
  }

  Future<void> fetchData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('your_collection')
          .doc('2dyLMDEuhOKTPWITd21v')
          .get();
      setState(() {
        name = doc['name']; // Firestore에서 이름 가져오기
        address = doc['address']; // Firestore에서 주소 가져오기
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Text(
                    name ?? '이름을 가져오는 중...',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  address ?? '주소를 가져오는 중...',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 4),
                imageUrls.isNotEmpty
                    ? Image.network(
                        imageUrls[3], // 첫 번째 이미지를 표시
                        height: 20,
                        fit: BoxFit.contain,
                      )
                    : CircularProgressIndicator(), // 로딩 상태 표시
                // 로딩 상태 표시
              ],
            ),
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                int imageIndex = index + 1; // 1, 2, 3 번째 이미지를 표시
                return imageUrls.length > imageIndex
                    ? Image.network(
                        imageUrls[imageIndex],
                        width: 60,
                        fit: BoxFit.contain,
                      )
                    : Container(); // 이미지가 없는 경우 빈 컨테이너
              }),
            ),
            Scroll2(), // Scroll2()는 별도의 위젯으로 가정
            const TabBar(
              tabs: [
                Tab(text: '리뷰'),
                Tab(text: '정보'),
                Tab(text: '메뉴'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ReviewPage1(), // 리뷰 페이지
                  Center(child: Text('탭 2의 내용')),
                  Center(child: Text('탭 3의 내용')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
