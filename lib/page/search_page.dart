import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'create_page.dart';

class SearchPage extends StatefulWidget {
  var user;
  SearchPage(this.user);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
        backgroundColor: Colors.white,
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: () {
          Get.toNamed("/create", arguments: widget.user);
        },
      ),
    );
  }

  Widget _buildBody() {
    //GET FIREBASE DB(POST)
    //STREAM 데이터가 변경되면 즉각 반응
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('post').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        var items = snapshot.data!.docs;
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _bulidListItem(context, items[index]);
            });
      },
    );
  }

  Widget _bulidListItem(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        child: InkWell(
          child: Image.network(document['photoUrl'], fit: BoxFit.cover),
          onTap: () {
            Get.toNamed("/detail", arguments: document);
          },
        ),
      ),
    );
  }
}
