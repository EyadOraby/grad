import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TemplatePage extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final Widget? drawerMobile;
  final Widget? bottomNavBar;
  final int index;

  const TemplatePage({
    Key? key,
    required this.body,
    required this.appBarTitle,
    required this.index,
    this.drawerMobile,
    required this.bottomNavBar,
  }) : super(key: key);

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
                title: Text(appBarTitle),
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
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              color: Colors.blue.shade200,
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
                            Expanded(child: body)
                          ],
                        ),
                      ))
                ],
              )
            : body,
        bottomNavigationBar:
            MediaQuery.of(context).size.width > 600 ? null : bottomNavBar);
  }
}
