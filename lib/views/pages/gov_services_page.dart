import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/home_page.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:grad/views/widgets/gov_services_buttton.dart';

import '../../main.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/services_button.dart';
import '../widgets/template.dart';

class GovServicesPage extends StatefulWidget {
  const GovServicesPage({Key? key}) : super(key: key);

  @override
  State<GovServicesPage> createState() => _GovServicesPageState();
}

class _GovServicesPageState extends State<GovServicesPage> {
  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    return TemplatePage(
      drawerMobile: Drawer(
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
      ),
      appBarTitle: 'SANAD',
      index: 0,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                GovServicesButton(
                  serviceTitle:
                      "Integrated \n Services \n Card \n Applications",
                ),
                GovServicesButton(
                    serviceTitle: "National ID \n Card \n Renewal"),
              ],
            ),
          ),
        ],
      ),
      bottomNavBar: BottomNavBar(
        index: 1,
      ),
    );
  }
}
