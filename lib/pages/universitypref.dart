import 'package:anak_kampus/components/bottom_button.dart';
import 'package:anak_kampus/components/circle_pref.dart';
import 'package:anak_kampus/constant.dart';
import 'package:anak_kampus/pages/prefence_page.dart';
import 'package:anak_kampus/services/getprov_api.dart';
import 'package:anak_kampus/services/getuniv_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UniversityPreference extends StatefulWidget {
  final String occupation;

  UniversityPreference({this.occupation});
  @override
  _UniversityPreferenceState createState() => _UniversityPreferenceState();
}

class _UniversityPreferenceState extends State<UniversityPreference> {
  TextEditingController controller = TextEditingController();
  List<dynamic> _allResource = [];
  List<dynamic> _search = [];
  bool isLoading;
  bool isTextFieldError = false;

  @override
  void initState() {
    super.initState();

    if (widget.occupation == 'Sudah Mahasiswa') {
      getAllUniversity();
    } else {
      getAllProvinsi();
    }
  }

  void getAllProvinsi() async {
    setState(() {
      isLoading = true;
    });

    await Provinsi.connectToAPI().then((value) {
      _allResource = value;
    });

    setState(() {
      isLoading = false;
    });
  }

  void getAllUniversity() async {
    setState(() {
      isLoading = true;
    });

    await Universitas.connectToAPI().then((value) {
      _allResource = value;
    });

    setState(() {
      isLoading = false;
    });
  }

  onSearch(String text) {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _allResource.forEach((element) {
      if (element.name.toLowerCase().contains(text.toLowerCase())) {
        _search.add(element);
      }
    });
    setState(() {});
  }

  bool keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF5E5CAC),
      resizeToAvoidBottomInset: false,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Stack(
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
                          number: '3',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          widget.occupation == 'Sudah Mahasiswa'
                              ? 'Dimana universitas tempat kuliah kamu?'
                              : 'Dimana daerah universitas impian kamu?',
                          textAlign: TextAlign.center,
                          style: kPrefHeadline,
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          width: keyboardIsVisible() ? 0 : width * 0.5,
                          height: keyboardIsVisible() ? 0 : width * 0.55,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3.0,
                              ),
                              borderRadius:
                                  BorderRadius.circular(width * 0.05)),
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              width: keyboardIsVisible() ? 0 : width * 0.35,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/Kampus.png'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.8,
                          child: TextField(
                            controller: controller,
                            onChanged: onSearch,
                            maxLines: 1,
                            maxLength: 30,
                            style: GoogleFonts.montserratAlternates(
                              textStyle: TextStyle(color: Colors.white),
                            ),
                            cursorColor: Colors.white,
                            showCursor: true,
                            textAlign: controller.text.isEmpty
                                ? TextAlign.center
                                : TextAlign.left,
                            decoration: InputDecoration(
                              counterText: '',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              hintText: 'Ketik untuk mencari',
                              hintStyle: GoogleFonts.montserratAlternates(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              prefixIcon: Visibility(
                                visible: isTextFieldError,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Icon(
                                    Icons.error,
                                    color: Color(0xFFDF5880),
                                    size: 25.0,
                                  ),
                                ),
                              ),
                              // suffixIcon: Padding(
                              //   padding: const EdgeInsets.only(right: 8.0),
                              //   child: IconButton(
                              //     onPressed: () {
                              //       onSearch(controller.text);
                              //       controller.clear();
                              //     },
                              //     icon: Icon(
                              //       Icons.search,
                              //       size: 30.0,
                              //       color: Colors.white,
                              //     ),
                              //   ),
                              // ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3.0,
                                ),
                                borderRadius:
                                    BorderRadius.circular(width * 0.12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3.0,
                                ),
                                borderRadius:
                                    BorderRadius.circular(width * 0.12),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.2,
                          child: ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final element = _search[i];
                              return GestureDetector(
                                onTap: () {
                                  controller.text = element.name;
                                  _search.clear();
                                  setState(() {});
                                },
                                child: Container(
                                  width: width * 0.8,
                                  margin: EdgeInsets.only(
                                    left: width * 0.1,
                                    right: width * 0.1,
                                    bottom: 10.0,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 10.0,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFA498EB),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.12)),
                                  child: Text(
                                    element.name,
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _search.length > 1 ? false : true,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: _search.length == 1
                          ? EdgeInsets.only(bottom: height * 0.1)
                          : EdgeInsets.only(bottom: height * 0.18),
                      child: BottomButton(
                        description: "Selesai",
                        onTap: () async {
                          bool isAny = false;
                          dynamic element;

                          for (element in _allResource) {
                            if (element.name == controller.text) {
                              isAny = true;
                              break;
                            }
                          }

                          if (controller.text.isEmpty || !isAny) {
                            setState(() {
                              isTextFieldError = true;
                              return;
                            });
                          } else {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            if (widget.occupation == 'Sudah Mahasiswa') {
                              print('university: ' + controller.text);
                              print('province: ' + element.province);
                              prefs.setString('universitas', controller.text);
                              prefs.setString('province', element.province);
                            } else {
                              print('province: ' + controller.text);
                              prefs.setString('province', controller.text);
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PreferencePage(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
