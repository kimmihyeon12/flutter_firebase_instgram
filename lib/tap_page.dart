import 'package:flutter/material.dart';
import 'package:instagramproject/account_page.dart';
import 'package:instagramproject/home_page.dart';
import 'package:instagramproject/search_page.dart';

class TapPage extends StatefulWidget {
  var user;
  TapPage(this.user);

  @override
  _TapPageState createState() => _TapPageState();
}

class _TapPageState extends State<TapPage> {
  late List _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(widget.user)
    ];
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('account')),
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
