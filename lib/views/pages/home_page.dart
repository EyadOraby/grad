import 'package:grad/l10n/sanad_strings.dart';
import 'package:grad/theme/sanad_colors.dart';
import 'package:material_ui/material_ui.dart';
import 'package:grad/views/widgets/civic_emblem.dart';
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
            CarouselSlider(
              items: [
                for (int i = 0; i < 4; i++)
                  _HighlightCard(
                    emblem: const [Emblem.government, Emblem.medical, Emblem.jobs, Emblem.assistant][i],
                    title: highlightsTitleArray[i],
                    subtitle: [
                      context.t('ID renewal and integrated services cards, tracked end to end'),
                      context.t('Doctors, hospitals and therapy centres you can book'),
                      context.t('Jobs and courses matched to you'),
                      context.t('A voice assistant for every service'),
                    ][i],
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

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({required this.emblem, required this.title, required this.subtitle});

  final Emblem emblem;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.fromLTRB(20, 18, 14, 18),
      decoration: BoxDecoration(color: SanadColors.primary, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700, height: 1.2)),
                const SizedBox(height: 6),
                Text(subtitle, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white.withValues(alpha: .82), fontSize: 14, height: 1.4)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(width: 92, height: 92, child: CivicEmblem(emblem)),
        ],
      ),
    );
  }
}
