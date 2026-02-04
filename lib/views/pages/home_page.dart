import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/classes/facts.dart';
import 'package:flutter_application_1/data/notifiers.dart';
import 'package:flutter_application_1/widgets/hero_widget.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Fact> _futureFact;
  @override
  void initState() {
    _futureFact = getData();
    super.initState();
  }

  Future<Fact> getData() async {
    var url = Uri.https('meowfacts.herokuapp.com', '', {'q': 'count=1'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Fact.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureFact,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          Fact fact = snapshot.data;
          return ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkMode, child) {
              return InkWell(
                splashColor: isDarkMode
                    ? Color.fromARGB(255, 64, 64, 64)
                    : Color.fromARGB(70, 87, 87, 87),
                splashFactory: InkRipple.splashFactory,
    
                onTap: () {},
                child: Center(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: const HeroWidget(),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 30.0),
                          width: double.infinity,
                          child: Opacity(
                            opacity: 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 100.0,
                                  vertical: 15.0,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Home Page',
                                      style: TextStyle(
                                        color: isDarkMode
                                            ? const Color.fromARGB(
                                                255,
                                                24,
                                                169,
                                                154,
                                              )
                                            : const Color.fromARGB(
                                                255,
                                                10,
                                                73,
                                                67,
                                              ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      fact.fact,
                                      style: TextStyle(
                                        color: isDarkMode
                                            ? const Color.fromARGB(
                                                255,
                                                24,
                                                169,
                                                154,
                                              )
                                            : const Color.fromARGB(
                                                255,
                                                10,
                                                73,
                                                67,
                                              ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('Error loading data'));
        }
      },
    );
  }
}
