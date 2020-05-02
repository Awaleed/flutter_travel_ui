import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () => setState(() {
        _selectedIndex = index;
      }),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xffe7ebee),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xffb4c1c4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: Text(
                'What you would like to find?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry entry) => _buildIcon(entry.key))
                  .toList(),
            ),
            SizedBox(height: 20),
            DestinationCarousel(),
            SizedBox(height: 20),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => _currentTab = index),
        currentIndex: _currentTab,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              Icons.local_pizza,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('http://i.imgur.com/bUh3i8q.gif'),
            ),
          ),
        ],
      ),
    );
  }
}
