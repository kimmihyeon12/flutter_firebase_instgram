import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  var user;
  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  int _postCount = 0;
  late List userPost = [];
  @override
  void initState() {
    print('account');
    // TODO: implement initState
    print(widget.user.email);
    super.initState();
    FirebaseFirestore.instance
        .collection('post')
        .where('email', isEqualTo: widget.user.email)
        .get()
        .then((snapshot) {
      setState(() {
        _postCount = snapshot.docs.length;
        userPost = snapshot.docs;
        print(userPost.length);
        for (int i = 0; i < userPost.length; i++) {
          print(userPost[i].data()["photoUrl"]);
        }
      });
    });
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
              Text(
                '$_postCount\n게시물',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Text('0\n팔로워',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
              Text('0\n팔로잉',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: userPost.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: Image.network(userPost[index].data()["photoUrl"],
                    fit: BoxFit.cover),
              );
            }),
      ],
    );
  }
}
