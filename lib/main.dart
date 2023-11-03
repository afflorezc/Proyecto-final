import 'package:flutter/material.dart';
import 'package:power_bike/src/storage/personal_data.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/first_use/survey_data_controller.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());
  final PersonalDataStorage personalData = PersonalDataStorage(id:0) ;
  final SurveyData surveyData = SurveyData(personalData: personalData);
  personalData.route();
  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(
    settingsController: settingsController, 
    surveyData: surveyData,
    ));
}
