import 'package:grad/theme/sanad_colors.dart';
import 'package:grad/views/pages/accessibility_page.dart';
import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final Widget? drawerMobile;
  final Widget? bottomNavBar;
  final int index;

  const TemplatePage({
    super.key,
    required this.body,
    required this.appBarTitle,
    required this.index,
    this.drawerMobile,
    required this.bottomNavBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MediaQuery.of(context).size.width > 600
            ? null
            : drawerMobile != null
                ? Drawer(
                    child: drawerMobile,
                  )
                : null,
        appBar: MediaQuery.of(context).size.width > 600
            ? null
            : AppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
                centerTitle: true,
                iconTheme: const IconThemeData(color: SanadColors.ink),
                backgroundColor: SanadColors.surface,
                actions: [
                  IconButton(
                    tooltip: 'Accessibility settings',
                    icon: const Icon(Icons.accessibility_new_rounded),
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const AccessibilityPage())),
                  ),
                ],
                title: Image.asset('assets/sanad.JPG', height: 40, colorBlendMode: BlendMode.multiply, color: SanadColors.surface),
                // A thin gold rule under the header, a nod to official documents.
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(3),
                  child: Container(
                    height: 3,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        SanadColors.gold.withValues(alpha: 0),
                        SanadColors.gold,
                        SanadColors.gold.withValues(alpha: 0),
                      ]),
                    ),
                  ),
                ),
              ),
        body: MediaQuery.of(context).size.width > 600
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 1,
                      child: Material(
                        elevation: 15,
                        child: drawerMobile,
                      )),
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            color: SanadColors.line,
                            height: 60,
                            child: Row(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      appBarTitle,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                body,
                              ],
                            ),
                          ))
                        ],
                      ))
                ],
              )
            : body,
        bottomNavigationBar:
            MediaQuery.of(context).size.width > 600 ? null : bottomNavBar);
  }
}
