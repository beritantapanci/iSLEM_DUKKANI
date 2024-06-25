import 'dart:ffi';
import 'dart:math';

import 'package:islem_dukkani/question.dart';

import '../../core/constants/app_constants.dart';

import '../../core/controllers/theme_controller.dart';
//import '../../core/reusable_widgets/check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/mixin/form_validation.dart';
import '../../core/reusable_widgets/check_box.dart';
import '../../core/reusable_widgets/elevated_button.dart';
import '../../core/reusable_widgets/label_text.dart';
import '../../core/reusable_widgets/text_form_field.dart';
import 'game_page.dart';
//import '../../core/reusable_widgets/text_form_field.dart';
//import '../../core/reusable_widgets/raised_button.dart';
//import '../../core/reusable_widgets/text_form_field.dart';
//import 'game_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with FormValidation {
  final TextEditingController _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final double _min = 1;
  final double _max = 10;

  int _gameEndTime = 1;

  bool _lowLevel = false;
  bool _mediumLevel = false;
  bool _hardLevel = false;
  //int _step = 30;

  // Random random = new Random();
  //int _targetMovementSpeed = 850;

  bool _isDark = false;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // get questionBank => null;

  //get randomIndex => null;

  @override
  Widget build(BuildContext context) {
    final themeStorage = GetStorage();
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (themeValue) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                icon: Icon(themeStorage.read(ApplicationConstants.APP_THEME)
                    ? Icons.lightbulb
                    : Icons.lightbulb_outline),
                onPressed: () async {
                  _isDark =
                      await themeStorage.read(ApplicationConstants.APP_THEME);
                  themeValue.saveTheme(!_isDark);
                  Get.changeTheme(
                      themeStorage.read(ApplicationConstants.APP_THEME)
                          ? ThemeData.dark()
                          : ThemeData.light());
                },
              ),
            ],
            centerTitle: true,
            title: const LabelText(text: 'islem dukkani'),
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        userNameTextFormField,
                        const SizedBox(height: 20),
                        const LabelText(text: 'Oyun süresi seçiniz (dakika)'),
                        slider,
                        const LabelText(text: 'Zorluk seviyesi'),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const LabelText(
                                text: 'Kolay',
                              ),
                              lowCheckBox,
                              const LabelText(
                                text: 'Orta',
                              ),
                              mediumCheckBox,
                              const LabelText(
                                text: 'Zor',
                              ),
                              hardLevelCheckBox,
                            ],
                          ),
                        ),
                        startGameButton,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get userNameTextFormField => MyTextFormField(
        autoValidate: false,
        controller: _usernameController,
        password: false,
        prefixIcon: Icon(Icons.star),
        validationFunction: checkString,
        key: null,
        label: "oyuncu adı",
        fontWeight: FontWeight.bold,
      );

  Widget get slider => Slider(
        min: _min,
        value: _gameEndTime.toDouble(),
        onChanged: (value) => setState(() => _gameEndTime = value.toInt()),
        activeColor: Colors.red,
        label: _gameEndTime.floor().toString(),
        max: _max,
        divisions: 9,
        inactiveColor: Colors.white,
        mouseCursor: MouseCursor.defer,
        onChangeStart: (value) => setState(() => _gameEndTime = value.toInt()),
        onChangeEnd: (value) => setState(() => _gameEndTime = value.toInt()),
      );
  Widget get lowCheckBox => DefaultCheckBox(
        value: _lowLevel,
        onChanged: (value) {
          setState(() {
            if (!_lowLevel || _mediumLevel || _hardLevel) {
              _lowLevel = value;
              _mediumLevel = false;
              _hardLevel = false;

              //_step = Random().nextInt(10) + 1;
              // int randomIndex = random.nextInt(5);
              //Question randomQuestion = questionBank[randomIndex];
            }
          });
        },
      );
  Widget get mediumCheckBox => DefaultCheckBox(
        value: _mediumLevel,
        onChanged: (value) {
          setState(() {
            if (!_mediumLevel || _lowLevel || _hardLevel) {
              _mediumLevel = value;
              _lowLevel = false;
              _hardLevel = false;

              //_step = Random().nextInt(6) + 10;
              // int randomIndex = random.nextInt(5 - 10);
              //Question randomQuestion = questionBank[randomIndex];
            }
          });
        },
      );

  Widget get hardLevelCheckBox => DefaultCheckBox(
        value: _hardLevel,
        onChanged: (value) {
          setState(() {
            if (!_hardLevel || _mediumLevel || _lowLevel) {
              _hardLevel = value;
              _mediumLevel = false;
              _lowLevel = false;
            }
          });
        },
      );

  Widget get startGameButton => DefaultElevatedButton(
        onPressed: () {
          autovalidateMode = AutovalidateMode.always;
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();
            if ((_lowLevel || _mediumLevel || _hardLevel) &&
                _usernameController.text.length > 0) {
              Get.off(
                GamePage(
                  userName: _usernameController.text,
                  gameEndTime: _gameEndTime * 60,
                  lowLevel: _lowLevel,
                  mediumLevel: _mediumLevel,
                  hardLevel: _hardLevel,
                ),
              );
            }
          } else {
            //_showSnackBar();
          }
          setState(() {
            _showSnackBar();
          });
        },
        label: 'Start',
        leftBorderRadiusValue: 25,
        rightBorderRadiusValue: 25,
      );

  _showSnackBar() {
    Get.snackbar("Error", "Lutfen tum alanlari doldurun",
        duration: const Duration(seconds: 2),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 25,
        ),
        isDismissible: true,
        margin: const EdgeInsets.all(12),
        maxWidth: double.infinity);
  }
}
