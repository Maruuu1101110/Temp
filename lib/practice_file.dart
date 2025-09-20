import 'package:flutter/material.dart';

class PracticeFile extends StatefulWidget {
  const PracticeFile({super.key});

  @override
  State<PracticeFile> createState() => _PracticeFileState();
}

class _PracticeFileState extends State<PracticeFile> {
  late String _title = "Home";
  int _currentIndex = 0;
  late final List<Widget> _page = [
    Center(
      child: Text(
        "Home Screen",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    _createPage("Container Widget", _createContainer()),
    _createPage("Column Widget", _columnPage()),
    _createPage("Row Widget", _createRow()),
  ];

  Widget _createPage(String title, Widget widget) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        widget,
      ],
    );
  }

  Widget _createContainer() {
    return Container(width: 100, height: 100, color: Colors.blue);
  }

  Widget _columnPage() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_createContainer()],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_createContainer()],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _createContainer(),
                SizedBox(height: 10),
                _createContainer(),
                SizedBox(height: 10),
                _createContainer(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _createContainer(),
                SizedBox(height: 10),
                _createContainer(),
                SizedBox(height: 10),
                _createContainer(),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _createContainer(),
                SizedBox(height: 10),
                _createContainer(),
                SizedBox(height: 10),
                _createContainer(),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_createContainer(), SizedBox(height: 10)],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_createContainer(), SizedBox(height: 10)],
            ),
          ],
        ),
      ],
    );
  }

  Widget _createRow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _createContainer(),
            _createContainer(),
            _createContainer(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_createContainer(), _createContainer()],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _createContainer(),
            _createContainer(),
            _createContainer(),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_createContainer(), _createContainer()],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.menu, color: Colors.blue),
        actions: [
          Icon(Icons.settings),
          Icon(Icons.notifications),
          Icon(Icons.person),
        ],
      ),
      drawer: Drawer(),
      body: Center(child: _page[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                _title = "Home";
              case 1:
                _title = "Container";
              case 2:
                _title = "Column";
              case 3:
                _title = "Row";
            }
          });
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Container", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
            label: "Column",
            icon: Icon(Icons.view_column),
          ),
          BottomNavigationBarItem(label: "Row", icon: Icon(Icons.table_rows)),
        ],
      ),
    );
  }
}
