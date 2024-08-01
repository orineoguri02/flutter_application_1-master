import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/Signuppage.dart';
import 'package:flutter_application_1/screens/home/view/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // 로그인 성공 후 동작
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      print("로그인 성공: ${userCredential.user?.email}");
    } catch (e) {
      // 로그인 실패 시 에러 메시지 출력
      print("로그인 실패: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('로그인 실패: 다시 입력해주세요 ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              SizedBox(width: 190, child: Image.asset('assets/typelogo.png')),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: '이메일',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fillColor: Color(0xffB6C1F3),
                      filled: true),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 50.0),
              TextButton(
                onPressed: _login,
                child: const Text(
                  '로그인',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 1.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: const Text('회원가입',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
