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
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.grey.shade200,
                //backgroundColor: Color.fromRGBO(55, 131, 88, 1),
                // leading:
                // // IconButton(
                // //   icon: Icon(Icons.arrow_back_rounded),
                // //   onPressed: () {},
                // // ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/sanad.JPG',
                      fit: BoxFit.fitHeight,
                      height: 45,
                      colorBlendMode: BlendMode.multiply,
                      color: Colors.grey.shade200,
                    ),
                    SizedBox(
                      width: 75,
                    )
                  ],
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
                            color: Colors.green.shade200,
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
