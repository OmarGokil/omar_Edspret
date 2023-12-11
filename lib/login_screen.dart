import 'package:flutter/material.dart';
import 'package:flutter_application_2/custom_button.dart';
import 'package:flutter_application_2/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 32),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset('assets/images/login.png'),
                    const SizedBox(
                      height: 56,
                    ),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      'Selamat Datang Di Aplikasi Widyah Edu\nAplikasi Latihan Dan Konsultasi Soal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF6A7483)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomButtom(
                      buttomColor: Colors.white,
                      buttomTitle: 'Login With Goole',
                      iconPahth: 'assets/images/google-icon.png',
                      textColor: Colors.black,
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomeScreen();
                          },
                        ),
                      ),
                    ),
                    CustomButtom(
                      buttomColor: Colors.black,
                      buttomTitle: 'Login With Apple ID',
                      iconPahth: 'assets/images/apple-icon.png',
                      textColor: Colors.white,
                      onPressed: () =>
                          Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const HomeScreen();
                        },
                      )),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
