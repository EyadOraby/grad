import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:flutter/material.dart';
import 'package:grad/views/pages/medical_services/medical_services_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:grad/views/widgets/drawer_mobile.dart';

import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/services_button.dart';
import '../widgets/template.dart';
import 'gov_services/gov_services_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext scontext) {
    final deviceSize = MediaQuery.of(context).size;
    var highlightsArray = [
      "assets/e-gov_pic.png",
      "assets/medical-service.jpeg",
      "assets/job-services.jpg",
      "assets/ALLY.png"
    ];
    var highlightsTitleArray = [
      context.t("Governmental Services"),
      context.t("Medical Services"),
      context.t("Job Services"),
      "ALLY"
    ];

    return TemplatePage(
      drawerMobile: DrawerMobile(),
      appBarTitle: context.t('SANAD'),
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
                context.t("What's new"),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
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
                      color: Colors.blue.shade400,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            width: deviceSize.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(highlightsArray[i])),
                            ),
                            child: Container(
                              width: deviceSize.width,
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color:
                                    SanadColors.primary.withValues(alpha: 0.85),
                              ),
                              child: Text(
                                highlightsTitleArray[i],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 10,
                          //   right: 20,
                          //   child: Image.asset(
                          //     "assets/new_logo_hq-removebg-preview.png",
                          //     width: 70,
                          //   ),
                          // )
                        ],
                      ),
                    )
                ],
                options: CarouselOptions(
                  height: 160,
                  //aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  enlargeCenterPage: true,
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
                context.t("Choose from the different services we offer!"),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
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
              serviceImage: "assets/government2.png",
              color: SanadColors.primarySoft,
              serviceDescription:
                  "A fast and convenient way to apply for an integrated services card or access other governmental services.",
            ),
            ServicesButton(
              click: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MedicalServicesPage()));
              },
              serviceTitle: "Medical \nServices",
              serviceImage: "assets/medical2-icon.png",
              color: SanadColors.primary,
              serviceDescription:
                  "Providing you with personalized medical services based on your disability type, preferences and location",
            ),
            ServicesButton(
              click: () {},
              serviceTitle: context.t("Job Services"),
              serviceImage: "assets/job-icon.png",
              color: SanadColors.primarySoft,
              serviceDescription:
                  "Matching you with job opportunities, self and career developing courses based on your disability type, preferences and location",
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
