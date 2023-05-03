import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:grad/views/pages/gov_services_page.dart';
import 'package:grad/views/pages/home_page.dart';

import '../../main.dart';
import '../pages/splash_page.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  // '${AppConfigService.appUser?.name![0]}',
                  '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30),
                )),
            accountName: Text(
              // AppConfigService.appUser?.name ?? "No Name",
              '',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(
              // AppConfigService.appUser?.email ?? "No Email",
              '',
            ),
          ),
          ListTile(
            leading: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            },
            trailing: Icon(Icons.home_rounded),
          ),
          ListTile(
            leading: Text('Governmental Services'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GovServicesPage()),
              );
            },
            trailing: Icon(Icons.document_scanner_rounded),
          ),
          // ListTile(
          //   leading: Text('Album List'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (_) =>
          //               AlbumsPage(album: _albumController.albumList)),
          //     );
          //   },
          //   trailing: Icon(Icons.photo_album_outlined),
          // ),
          // ListTile(
          //   leading: Text('To Do List'),
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (_) =>
          //                 ToDoPage(todo: _toDoController.toDoList)));
          //   },
          //   trailing: Icon(Icons.task_rounded),
          // ),
          ListTile(
            leading: Text("Logout"),
            onTap: () async {
              var result = (await showFutureLoadingDialog(
                      context: context, future: () => prefs!.clear()))
                  .result;
              if (result ?? false) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SplashPage()),
                    (route) => false);
              } else {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actionsAlignment: MainAxisAlignment.center,
                        title: Text('Error Logging Out'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Try Again'))
                        ],
                      );
                    });
              }
            },
            trailing: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
