import 'package:car_rental_app/screen/navBarItems/home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      bottom: PreferredSize(
        child: Container(
          color: Colors.blueAccent,
          height: 3.0,
        ),
        preferredSize: Size.fromHeight(3.0),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.grey,
        ),
      ),
      title: Column(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                icon: Image.asset("images/HomepageIcon.png")),
          ),
          SizedBox(height: 5),
          Text(
            "Rent a Car",
            style: TextStyle(
              color: Color.fromARGB(255, 25, 51, 97),
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
            )),
      ],
    );
  }

  //Bottom Nav Bar
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Add Car',
      style: optionStyle,
    ),
    Text(
      'Index 2: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBar buildBottomAppBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle,
            size: 40,
          ),
          label: 'Add Car',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: buildBottomAppBar(),
    );
  }
}
