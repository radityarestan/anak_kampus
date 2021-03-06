import 'package:anak_kampus/components/bottom_button2.dart';
import 'package:anak_kampus/components/choice_box.dart';
import 'package:anak_kampus/components/circle_pref.dart';
import 'package:anak_kampus/constant.dart';
import 'package:anak_kampus/pages/universitypref.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgramPreference extends StatefulWidget {
  @override
  _ProgramPreferenceState createState() => _ProgramPreferenceState();
}

enum Cluster {
  Saintek,
  Soshum,
  IlmuKesehatan,
}

class _ProgramPreferenceState extends State<ProgramPreference> {
  Cluster selectedCluster;
  String selectedBg;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF5E5CAC),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: AssetImage('images/Background Preferensi.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: height * 0.1),
            child: Center(
              child: Column(
                children: [
                  CirclePref(
                    number: '2',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Apa rumpun program studi kamu?',
                    textAlign: TextAlign.center,
                    style: kPrefHeadline,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      viewportFraction: 0.45,
                      initialPage: 1,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        if (index == 0) {
                          selectedCluster = Cluster.Saintek;
                          selectedBg = 'saintek';
                        } else if (index == 1) {
                          selectedCluster = Cluster.Soshum;
                          selectedBg = 'soshum';
                        } else {
                          selectedCluster = Cluster.IlmuKesehatan;
                          selectedBg = 'ilmu kesehatan';
                        }
                        setState(() {});
                      },
                    ),
                    items: [
                      ChoiceBox(
                        selectedBackground:
                            selectedBg == 'saintek' ? 'true' : 'false',
                        selectedCheck:
                            selectedCluster == Cluster.Saintek ? true : false,
                        choiceDescription: 'Saintek',
                        assetImage: 'images/Saintek.png',
                      ),
                      ChoiceBox(
                        selectedBackground: selectedBg == null
                            ? 'null'
                            : selectedBg == 'soshum'
                                ? 'true'
                                : 'false',
                        selectedCheck:
                            selectedCluster == Cluster.Soshum ? true : false,
                        choiceDescription: 'Soshum',
                        assetImage: 'images/Soshum.png',
                      ),
                      ChoiceBox(
                        selectedBackground:
                            selectedBg == 'ilmu kesehatan' ? 'true' : 'false',
                        selectedCheck: selectedCluster == Cluster.IlmuKesehatan
                            ? true
                            : false,
                        choiceDescription: 'Ilmu Kesehatan',
                        assetImage: 'images/RIK.png',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  BottomButton2(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (selectedCluster == Cluster.Saintek) {
                        prefs.setString('cluster', 'Saintek');
                      } else if (selectedCluster == Cluster.IlmuKesehatan) {
                        prefs.setString('cluster', 'Ilmu Kesehatan');
                      } else {
                        prefs.setString('cluster', 'Soshum');
                      }

                      print('cluster: ' + prefs.getString('cluster'));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UniversityPreference(
                            occupation: prefs.getString('occupation'),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
