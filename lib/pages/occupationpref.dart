import 'package:anak_kampus/components/bottom_button2.dart';
import 'package:anak_kampus/components/choice_box.dart';
import 'package:anak_kampus/components/circle_pref.dart';
import 'package:anak_kampus/components/bottom_button.dart';
import 'package:anak_kampus/constant.dart';
import 'package:anak_kampus/pages/prefence_page.dart';
import 'package:anak_kampus/pages/programpref.dart';
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                        onTap: () {
                          setState(() {
                            selectedOccupation = Occupation.SudahMahasiswa;
                          });
                        },
                      ),
                      SizedBox(width: 10.0),
                      ChoiceBox(
                        selectedBackground: selectedOccupation == null
                            ? 'null'
                            : selectedOccupation == Occupation.CalonMahasiswa
                                ? 'true'
                                : 'false',
                        selectedCheck:
                            selectedOccupation == Occupation.CalonMahasiswa,
                        choiceDescription: 'Calon Mahasiswa',
                        assetImage: 'images/Calon Mahasiswa.png',
                        onTap: () {
                          setState(() {
                            selectedOccupation = Occupation.CalonMahasiswa;
                          });
                        },
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
