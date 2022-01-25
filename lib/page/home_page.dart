import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var user;
  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("instagram clone",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return (Padding(
      padding: EdgeInsets.all(8),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const Text('Instargram에 오신것을 환영합니다',
                  style: TextStyle(fontSize: 24)),
              const Padding(padding: EdgeInsets.all(8)),
              const Text('사진과 동영상을 보려면 팔로우하세요', style: TextStyle(fontSize: 24)),
              const Padding(padding: EdgeInsets.all(16)),
              SizedBox(
                width: 260.0,
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(4)),
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('${user.photoURL}'),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Text('${user.email}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                      Text('${user.displayName}',
                          style: TextStyle(fontSize: 12)),
                      const Padding(padding: EdgeInsets.all(8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ15zSdjbO9AVI7jG0_bVAT4bFYeMg3HaGqqQ&usqp=CAU',
                                fit: BoxFit.cover),
                          ),
                          const Padding(padding: EdgeInsets.all(1)),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ15zSdjbO9AVI7jG0_bVAT4bFYeMg3HaGqqQ&usqp=CAU',
                                fit: BoxFit.cover),
                          ),
                          const Padding(padding: EdgeInsets.all(1)),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ15zSdjbO9AVI7jG0_bVAT4bFYeMg3HaGqqQ&usqp=CAU',
                                fit: BoxFit.cover),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      const Text('facebook 친구', style: TextStyle(fontSize: 12)),
                      const Padding(padding: EdgeInsets.all(4)),
                      RaisedButton(
                          child: const Text('팔로우'),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {}),
                      const Padding(padding: EdgeInsets.all(4)),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    ));
  }
}
