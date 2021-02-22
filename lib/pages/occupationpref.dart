import 'package:anak_kampus/components/bottom_button2.dart';
import 'package:anak_kampus/components/choice_box.dart';
import 'package:anak_kampus/components/circle_pref.dart';
import 'package:anak_kampus/constant.dart';
import 'package:anak_kampus/pages/programpref.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OccupationPreference extends StatefulWidget {
  @override
  _OccupationPreferenceState createState() => _OccupationPreferenceState();
}

enum Occupation {
  SudahMahasiswa,
  CalonMahasiswa,
}

class _OccupationPreferenceState extends State<OccupationPreference> {
  Occupation selectedOccupation;
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
                    number: '1',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Apa okupasi kamu sekarang?',
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
                      initialPage: 0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        if (index == 0) {
                          selectedOccupation = Occupation.SudahMahasiswa;
                          selectedBg = 'saintek';
                        } else {
                          selectedOccupation = Occupation.CalonMahasiswa;
                          selectedBg = 'soshum';
                        }
                        setState(() {});
                      },
                    ),
                    items: [
                      ChoiceBox(
                        selectedBackground: selectedOccupation == null
                            ? 'null'
                            : selectedOccupation == Occupation.SudahMahasiswa
                                ? 'true'
                                : 'false',
                        selectedCheck:
                            selectedOccupation == Occupation.SudahMahasiswa,
                        choiceDescription: 'Sudah Mahasiswa',
                        assetImage: 'images/Mahasiswa.png',
                      ),
                      ChoiceBox(
                        selectedBackground:
                            selectedOccupation == Occupation.CalonMahasiswa
                                ? 'true'
                                : 'false',
                        selectedCheck:
                            selectedOccupation == Occupation.CalonMahasiswa,
                        choiceDescription: 'Calon Mahasiswa',
                        assetImage: 'images/Calon Mahasiswa.png',
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
                      if (selectedOccupation == Occupation.CalonMahasiswa) {
                        prefs.setString('occupation', 'Calon Mahasiswa');
                      } else {
                        prefs.setString('occupation', 'Sudah Mahasiswa');
                      }

                      print('occupation: ' + prefs.getString('occupation'));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProgramPreference()));
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
