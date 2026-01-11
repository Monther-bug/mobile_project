import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The app title
  ///
  /// In en, this message translates to:
  /// **'Coding Practice'**
  String get appTitle;

  /// Home navigation label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Discover navigation label
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// Ranking navigation label
  ///
  /// In en, this message translates to:
  /// **'Ranking'**
  String get ranking;

  /// History navigation label
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// Profile navigation label
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Daily challenge title
  ///
  /// In en, this message translates to:
  /// **'Daily Challenge'**
  String get dailyChallenge;

  /// Completed status
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// Categories section title
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// All filter option
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Recent problems section title
  ///
  /// In en, this message translates to:
  /// **'Recent Problems'**
  String get recentProblems;

  /// See all button text
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// Problems solved stat label
  ///
  /// In en, this message translates to:
  /// **'Problems Solved'**
  String get problemsSolved;

  /// Current streak stat label
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get currentStreak;

  /// Easy difficulty
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// Medium difficulty
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// Hard difficulty
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// Description tab
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Solution tab
  ///
  /// In en, this message translates to:
  /// **'Solution'**
  String get solution;

  /// Your solution section title
  ///
  /// In en, this message translates to:
  /// **'Your Solution'**
  String get yourSolution;

  /// Submit solution button
  ///
  /// In en, this message translates to:
  /// **'Submit Solution'**
  String get submitSolution;

  /// Solution passed message
  ///
  /// In en, this message translates to:
  /// **'Solution Passed!'**
  String get solutionPassed;

  /// Solution status label
  ///
  /// In en, this message translates to:
  /// **'Solution Status'**
  String get solutionStatus;

  /// Output label
  ///
  /// In en, this message translates to:
  /// **'Output'**
  String get output;

  /// Hint label
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hint;

  /// Test cases section
  ///
  /// In en, this message translates to:
  /// **'Test Cases'**
  String get testCases;

  /// Input label
  ///
  /// In en, this message translates to:
  /// **'Input'**
  String get input;

  /// Expected output label
  ///
  /// In en, this message translates to:
  /// **'Expected Output'**
  String get expectedOutput;

  /// Leaderboard title
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get leaderboard;

  /// Points label
  ///
  /// In en, this message translates to:
  /// **'points'**
  String get points;

  /// Problems solved count
  ///
  /// In en, this message translates to:
  /// **'{count} problems solved'**
  String problemsSolvedCount(int count);

  /// Submission history title
  ///
  /// In en, this message translates to:
  /// **'Submission History'**
  String get submissionHistory;

  /// Passed status
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get passed;

  /// Failed status
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// Pending status
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No history message
  ///
  /// In en, this message translates to:
  /// **'No submissions yet'**
  String get noHistoryYet;

  /// Start solving message
  ///
  /// In en, this message translates to:
  /// **'Start solving problems to see your history here.'**
  String get startSolving;

  /// Settings menu item
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Help center menu item
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// Logout button
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logout;

  /// Logout confirmation title
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logoutConfirmTitle;

  /// Logout confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmMessage;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Login button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Register button
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Welcome back message
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// Create account message
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Don't have account text
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Already have account text
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Search placeholder
  ///
  /// In en, this message translates to:
  /// **'Search problems...'**
  String get searchProblems;

  /// No problems found message
  ///
  /// In en, this message translates to:
  /// **'No problems found'**
  String get noProblemsFound;

  /// Failed to load message
  ///
  /// In en, this message translates to:
  /// **'Failed to load'**
  String get failedToLoad;

  /// Retry button
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Python language label
  ///
  /// In en, this message translates to:
  /// **'Python'**
  String get python;

  /// Code placeholder
  ///
  /// In en, this message translates to:
  /// **'# Write your Python code here'**
  String get writeCodeHere;

  /// Total points label
  ///
  /// In en, this message translates to:
  /// **'Total Points'**
  String get totalPoints;

  /// Rank label
  ///
  /// In en, this message translates to:
  /// **'Rank'**
  String get rank;

  /// Good morning greeting
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// Good afternoon greeting
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// Good evening greeting
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEvening;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
