import 'package:flutter/material.dart';
import '../views/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String username = "";
  String password = "";
  bool isloginsuccess = true;

  Widget build(BuildContext context) {
    return Container(
      //untuk menampilkan gambar background
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              // untuk menampilkan judul
              width: double.infinity,
              padding: EdgeInsets.only(top: 130),
              child: Text(
                'Welcome\nBack',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 37,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                //untuk textfield username dan passwordnya
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                username = value;
                              });
                            },
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // untuk menampilkan button login
                      margin: EdgeInsets.only(left: 35, right: 35),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(58, 67, 77, 1),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          String notif = "";
                          if (username == "admin" && password == "123") {
                            setState(() {
                              notif = "Login Sukses";
                              isloginsuccess = true;
                            });
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          } else {
                            setState(() {
                              notif = "Login Gagal";
                              isloginsuccess = false;
                            });
                          }
                          SnackBar snackBar = SnackBar(
                            content: Text(
                              notif,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: (isloginsuccess)
                                ? Color(0xFF7CDF64)
                                : Color(0xFFFF686B),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
