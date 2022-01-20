import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final document;
  DetailPage(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('둘러보기'),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(document['userPhotoUrl']),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(document['email'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(document['displayName'],
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
          Hero(
              tag: document['photoUrl'],
              child: Image.network(document['photoUrl'], fit: BoxFit.cover)),
          Text(document['contents'])
        ],
      ),
    ));
  }
}
