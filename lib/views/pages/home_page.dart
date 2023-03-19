import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';

import '../../main.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/template.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBarTitle: 'Spark Tile Lite',
      index: 0,
      body: Text(
        'Spark Tile Lite',
        style: TextStyle(
            color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
      ),
      // body: _postController.postsList == null
      //     ? const Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : _postController.postsList?.isEmpty ?? false
      //         ? const Center(
      //             child: Text('No Data'),
      //           )
      //         : ListView.builder(
      //             itemCount: _postController.postsList?.length,
      //             itemBuilder: (context, index) {
      //               return Padding(
      //                 padding: const EdgeInsets.fromLTRB(10, 10, 15, 5),
      //                 child: PostWidget(
      //                   post: _postController.postsList![index],
      //                   onCommentClicked: () {},
      //                   onPostClicked: () {
      //                     Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (_) => PostDetails(
      //                                 post:
      //                                     _postController.postsList![index])));
      //                   },
      //                 ),
      //               );
      //             }),

      bottomNavBar: BottomNavBar(
        index: 0,
      ),
    );
  }
}
