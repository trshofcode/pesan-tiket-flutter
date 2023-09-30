import 'package:absensi/halaman/tiket/event.dart';
import 'package:absensi/halaman/tiket/histori.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  NavState createState() => NavState();
}

class NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOption = <Widget>[EventHalaman(), HistoriHalaman()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event_available_outlined),
            title: Text('Tersedia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            title: Text('Histori'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
