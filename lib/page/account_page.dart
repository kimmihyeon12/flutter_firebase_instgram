import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagramproject/controller/postController.dart';

class AccountPage extends StatefulWidget {
  var user;
  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final controller = Get.put(PostController());
  @override
  void initState() {
    super.initState();

    controller.optionFind(widget.user.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
            color: Colors.black,
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage('${widget.user.photoURL}'),
                        ),
                      ),
                      Container(
                          alignment: Alignment.bottomRight,
                          width: 80.0,
                          height: 80.0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 28.0,
                                height: 28.0,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: FloatingActionButton(
                                    onPressed: null,
                                    backgroundColor: Colors.blueAccent,
                                    child: Icon(Icons.add)),
                              ),
                            ],
                          ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Text(
                    '${widget.user.displayName}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Obx(
                () => Text(
                  '${controller.optionPost.length}\n게시물',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Text('0\n팔로워',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
              Text('0\n팔로잉',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        Obx(
          () => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: controller.optionPost.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.network(
                      controller.optionPost[index].data()["photoUrl"],
                      fit: BoxFit.cover),
                );
              }),
        ),
      ],
    );
  }
}
