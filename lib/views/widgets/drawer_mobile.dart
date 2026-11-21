import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:grad/views/pages/gov_services/gov_services_page.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/jobs_services/jobs_page.dart';
import 'package:grad/views/pages/medical_services/medical_services_page.dart';
import 'package:grad/views/pages/sign_up_page.dart';

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
                  'A',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: SanadColors.primary,
                      fontSize: 30),
                )),
            accountName: Text(
              // AppConfigService.appUser?.name ?? "No Name",
              'Aly Mohamed',
              style: TextStyle(fontSize: 20),
            ),
            accountEmail: Text(
              // AppConfigService.appUser?.email ?? "No Email",
              'aly@gmail.com',
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
          ListTile(
            leading: Text('Medical Services'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MedicalServicesPage()),
              );
            },
            trailing: Icon(Icons.medical_services_rounded),
          ),
          ListTile(
            leading: Text('Job Services'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => JobsPage()),
              );
            },
            trailing: Icon(Icons.work_rounded),
          ),
          ListTile(
            leading: Text('Sign up / Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SignUpPage()),
              );
            },
            // trailing: Icon(Icons.work_rounded),
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
