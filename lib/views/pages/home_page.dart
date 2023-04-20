import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grad/views/pages/splash_page.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../main.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/services_button.dart';
import '../widgets/template.dart';
import 'gov_services_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSliderIndex = 0;

  @override
  void initState() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    final deviceSize = MediaQuery.of(context).size;
    var highlights_array = [
      "assets/e-gov_pic.png",
      "assets/medical-service.jpeg",
      "assets/job-services.jpg",
      "assets/ALLY.png"
    ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "What's New!!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: CarouselSlider(
                items: [
                  for (int i = 0; i < 4; i++)
                    Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.blueGrey,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(highlights_array[i])),
                            ),
                            child: Container(
                              width: deviceSize.width,
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Color.fromARGB(150, 76, 175, 80),
                              ),
                              child: Text(
                                "Governmental Services",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 20,
                            child: Image.asset(
                              "assets/new_logo_hq-removebg-preview.png",
                              width: 70,
                            ),
                          )
                        ],
                      ),
                    )
                ],
                options: CarouselOptions(
                  height: 180,
                  //aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentSliderIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            // if (homeViewModel.highlights.isNotEmpty)
            //   createSliderIndicator(
            //     _currentSliderIndex,
            //     homeViewModel.highlights.length,
            //     AppColors.greyColor,
            //     AppColors.secondaryColor,
            //   ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose from the different services we offer!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ServicesButton(
              click: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GovServicesPage()));
              },
              serviceTitle: "Governmental \nServices",
              serviceImage: "assets/document-icon-19-removebg-preview.png",
              serviceDescription:
                  "A fast, convenient, and secure way to apply for an integrated services card or access other governmental services from the comfort of your homes.",
            ),
            ServicesButton(
              click: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GovServicesPage()));
              },
              serviceTitle: "Medical \n Services",
              serviceImage:
                  "assets/health-services-icon-png-removebg-preview.png",
              serviceDescription:
                  "Our medical service is dedicated to providing personalized care for individuals with disabilities. We offer a comprehensive platform that matches patients with the right medical professionals based on their disability type and preferred location.",
            ),
            ServicesButton(
              click: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GovServicesPage()));
              },
              serviceTitle: "Job Services",
              serviceImage: "assets/job_application-removebg-preview.png",
              serviceDescription:
                  "We offer a comprehensive platform that matches job seekers with the right positions based on their disability type and preferred location. We work with a wide range of industries and job types, so whether you are looking for part-time or full-time work, we can help you find the right fit.",
            ),
          ],
        ),
      ),
      bottomNavBar: BottomNavBar(
        index: 0,
      ),
    );
  }
}
