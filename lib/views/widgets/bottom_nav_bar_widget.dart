import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/gov_services_page.dart';

import '../pages/home_page.dart';

class BottomNavBar extends StatefulWidget {
  final int index;
  const BottomNavBar({Key? key, required this.index}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
            backgroundColor: Color.fromRGBO(55, 131, 88, 1)),
        BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_rounded),
            label: 'Gov. Services',
            backgroundColor: Color.fromRGBO(55, 131, 88, 1)),
        BottomNavigationBarItem(
            icon: Icon(Icons.task_rounded),
            label: 'ToDo',
            backgroundColor: Color.fromRGBO(55, 131, 88, 1)),
      ],
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.grey.shade800,
      currentIndex: widget.index,
      iconSize: 22,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));

            break;
          case 1:
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => GovServicesPage()));

            break;
          // case 2:
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (_) => ToDoPage(
          //                 todo: _toDoController.toDoList,
          //               )));

          //   break;
          default:
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
        }
      },
    );
  }
}
