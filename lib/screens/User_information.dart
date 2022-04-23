import 'package:doctor/screens/homeScreen.dart';
import 'package:doctor/widget/colors.dart';
import 'package:doctor/widget/detils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profiel extends StatelessWidget {
  static const String id = 'UserInfo';
   profiel({Key? key}) : super(key: key);

  int Number = 0;
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kprimryColors,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile'),
          backgroundColor: kappbar,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isclicked
                      ? Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 0.5,
                                    blurRadius: 7)
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          width: MediaQuery.of(context).size.width - 50,
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  facelogo(1),
                                  facelogo(2),
                                  facelogo(3),
                                  facelogo(4)
                                ],
                              ),
                              Row(
                                children: [
                                  facelogo(5),
                                  facelogo(6),
                                  facelogo(7),
                                  facelogo(8),
                                ],
                              ),
                              Row(
                                children: [
                                  facelogo(9),
                                  facelogo(10),
                                  facelogo(11),
                                  facelogo(12),
                                ],
                              ),
                            ],
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            
                              isclicked = true;
                          
                          },
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'images/faces/$Number.png',
                                        ),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.grey[200]),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue.withOpacity(0.5)),
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: kappbar,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'User name',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.email,
                          color: kappbar,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Email address',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: kappbar,
                        ),
                        SizedBox(width: 15),
                        Text(
                          'Phone Number',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded facelogo(int numberOfPhoto) {
    return Expanded(
        child: InkWell(
      onTap: () {
       
          Number = numberOfPhoto;
          isclicked = false;
      
      },
      child: Image.asset('images/faces/$numberOfPhoto.png'),
    ));
  }
}
