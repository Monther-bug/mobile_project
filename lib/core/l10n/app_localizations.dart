import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Coding Practice',
      'home': 'Home',
      'discover': 'Discover',
      'ranking': 'Ranking',
      'history': 'History',
      'profile': 'Profile',
      'dailyChallenge': 'Daily Challenge',
      'completed': 'Completed',
      'categories': 'Categories',
      'all': 'All',
      'recentProblems': 'Recent Problems',
      'seeAll': 'See All',
      'problemsSolved': 'Problems Solved',
      'currentStreak': 'Current Streak',
      'easy': 'Easy',
      'medium': 'Medium',
      'hard': 'Hard',
      'description': 'Description',
      'solution': 'Solution',
      'yourSolution': 'Your Solution',
      'submitSolution': 'Submit Solution',
      'solutionPassed': 'Solution Passed!',
      'solutionStatus': 'Solution Status',
      'output': 'Output',
      'hint': 'Hint',
      'testCases': 'Test Cases',
      'input': 'Input',
      'expectedOutput': 'Expected Output',
      'leaderboard': 'Leaderboard',
      'points': 'points',
      'submissionHistory': 'Submission History',
      'passed': 'Passed',
      'failed': 'Failed',
      'pending': 'Pending',
      'noHistoryYet': 'No submissions yet',
      'startSolving': 'Start solving problems to see your history here.',
      'settings': 'Settings',
      'helpCenter': 'Help Center',
      'logout': 'Log Out',
      'logoutConfirmTitle': 'Log Out',
      'logoutConfirmMessage': 'Are you sure you want to log out?',
      'cancel': 'Cancel',
      'login': 'Login',
      'register': 'Register',
      'email': 'Email',
      'password': 'Password',
      'confirmPassword': 'Confirm Password',
      'name': 'Name',
      'welcomeBack': 'Welcome Back',
      'createAccount': 'Create Account',
      'dontHaveAccount': "Don't have an account?",
      'alreadyHaveAccount': 'Already have an account?',
      'searchProblems': 'Search problems...',
      'noProblemsFound': 'No problems found',
      'failedToLoad': 'Failed to load',
      'retry': 'Retry',
      'python': 'Python',
      'writeCodeHere': '# Write your Python code here',
      'totalPoints': 'Total Points',
      'rank': 'Rank',
      'goodMorning': 'Good Morning',
      'goodAfternoon': 'Good Afternoon',
      'goodEvening': 'Good Evening',
      'noProblemsAvailable': 'No problems available',
      'errorLoadingExercises': 'Error loading exercises',
      'failedToLoadProblems': 'Failed to load problems',
      'failedToLoadLeaderboard': 'Failed to load leaderboard',
      'noLeaderboardData': 'No leaderboard data yet',
      'pleaseEnterCode': 'Please enter your code',
      'noProblemSelected': 'No problem selected',
      'activity': 'Activity',
      'editProfile': 'Edit Profile',
      'notifications': 'Notifications',
      'language': 'Language',
      'darkMode': 'Dark Mode',
      'privacySecurity': 'Privacy & Security',
      'selectLanguage': 'Select Language',
      'english': 'English',
      'arabic': 'Arabic',
      'solved': 'Solved',
      'pleaseEnterAllFields': 'Please fill in all fields',
      'passwordsDoNotMatch': 'Passwords do not match',
      'forgotPassword': 'Forgot Password?',
      'loginToContinue': 'Login to continue your coding journey',
      'startYourJourney': 'Start your journey with us',
      'fullName': 'Full Name',
      'hello': 'Hello',
      'masterYourSkills': 'Master your coding skills',
      'onboardingTitle1': 'Learn to Code',
      'onboardingDesc1': 'Master programming concepts through interactive lessons and practical examples.',
      'onboardingTitle2': 'Solve Problems',
      'onboardingDesc2': 'Challenge yourself with real-world coding problems and improve your logical thinking.',
      'onboardingTitle3': 'Compete & Win',
      'onboardingDesc3': 'Join the global leaderboard, compete with others, and showcase your skills.',
      'next': 'Next',
      'skip': 'Skip',
      'getStarted': 'Get Started',
    },
    'ar': {
      'appTitle': 'تمارين البرمجة',
      'home': 'الرئيسية',
      'discover': 'استكشف',
      'ranking': 'الترتيب',
      'history': 'السجل',
      'profile': 'الملف الشخصي',
      'dailyChallenge': 'تحدي اليوم',
      'completed': 'مكتمل',
      'categories': 'الفئات',
      'all': 'الكل',
      'recentProblems': 'المسائل الأخيرة',
      'seeAll': 'عرض الكل',
      'problemsSolved': 'المسائل المحلولة',
      'currentStreak': 'السلسلة الحالية',
      'easy': 'سهل',
      'medium': 'متوسط',
      'hard': 'صعب',
      'description': 'الوصف',
      'solution': 'الحل',
      'yourSolution': 'حلك',
      'submitSolution': 'إرسال الحل',
      'solutionPassed': 'الحل صحيح!',
      'solutionStatus': 'حالة الحل',
      'output': 'المخرجات',
      'hint': 'تلميح',
      'testCases': 'حالات الاختبار',
      'input': 'المدخلات',
      'expectedOutput': 'المخرجات المتوقعة',
      'leaderboard': 'لوحة المتصدرين',
      'points': 'نقاط',
      'submissionHistory': 'سجل الحلول',
      'passed': 'ناجح',
      'failed': 'فاشل',
      'pending': 'قيد الانتظار',
      'noHistoryYet': 'لا توجد حلول بعد',
      'startSolving': 'ابدأ بحل المسائل لرؤية سجلك هنا.',
      'settings': 'الإعدادات',
      'helpCenter': 'مركز المساعدة',
      'logout': 'تسجيل الخروج',
      'logoutConfirmTitle': 'تسجيل الخروج',
      'logoutConfirmMessage': 'هل أنت متأكد من تسجيل الخروج؟',
      'cancel': 'إلغاء',
      'login': 'تسجيل الدخول',
      'register': 'إنشاء حساب',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'confirmPassword': 'تأكيد كلمة المرور',
      'name': 'الاسم',
      'welcomeBack': 'مرحباً بعودتك',
      'createAccount': 'إنشاء حساب جديد',
      'dontHaveAccount': 'ليس لديك حساب؟',
      'alreadyHaveAccount': 'لديك حساب بالفعل؟',
      'searchProblems': 'ابحث عن مسائل...',
      'noProblemsFound': 'لا توجد مسائل',
      'failedToLoad': 'فشل في التحميل',
      'retry': 'إعادة المحاولة',
      'python': 'بايثون',
      'writeCodeHere': '# اكتب كود بايثون هنا',
      'totalPoints': 'إجمالي النقاط',
      'rank': 'الترتيب',
      'goodMorning': 'صباح الخير',
      'goodAfternoon': 'مساء الخير',
      'goodEvening': 'مساء الخير',
      'noProblemsAvailable': 'لا توجد مسائل متاحة',
      'errorLoadingExercises': 'خطأ في تحميل التمارين',
      'failedToLoadProblems': 'فشل تحميل المسائل',
      'failedToLoadLeaderboard': 'فشل تحميل لوحة المتصدرين',
      'noLeaderboardData': 'لا توجد بيانات للترتيب بعد',
      'pleaseEnterCode': 'الرجاء إدخال الكود',
      'noProblemSelected': 'لم يتم اختيار مسألة',
      'activity': 'النشاط',
      'editProfile': 'تعديل الملف الشخصي',
      'notifications': 'الإشعارات',
      'language': 'اللغة',
      'darkMode': 'الوضع الداكن',
      'privacySecurity': 'الخصوصية والأمان',
      'selectLanguage': 'اختر اللغة',
      'english': 'الإنجليزية',
      'arabic': 'العربية',
      'solved': 'محلولة',
      'pleaseEnterAllFields': 'يرجى ملء جميع الحقول',
      'passwordsDoNotMatch': 'كلمات المرور غير متطابقة',
      'forgotPassword': 'نسيت كلمة المرور؟',
      'loginToContinue': 'سجل دخولك لمتابعة رحلة البرمجة',
      'startYourJourney': 'ابدأ رحلتك معنا',
      'fullName': 'الاسم الكامل',
      'hello': 'مرحباً',
      'masterYourSkills': 'أتقن مهاراتك البرمجية',
      'onboardingTitle1': 'تعلم البرمجة',
      'onboardingDesc1': 'أتقن مفاهيم البرمجة من خلال دروس تفاعلية وأمثلة عملية.',
      'onboardingTitle2': 'حل المسائل',
      'onboardingDesc2': 'تحدى نفسك بمسائل برمجية واقعية وحسن تفكيرك المنطقي.',
      'onboardingTitle3': 'نافس واربح',
      'onboardingDesc3': 'انضم إلى لوحة المتصدرين العالمية، نافس الآخرين، واستعرض مهاراتك.',
      'next': 'التالي',
      'skip': 'تخطي',
      'getStarted': 'ابدأ الآن',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  // Getters for all translations
  String get appTitle => translate('appTitle');
  String get home => translate('home');
  String get discover => translate('discover');
  String get ranking => translate('ranking');
  String get history => translate('history');
  String get profile => translate('profile');
  String get dailyChallenge => translate('dailyChallenge');
  String get completed => translate('completed');
  String get categories => translate('categories');
  String get all => translate('all');
  String get recentProblems => translate('recentProblems');
  String get seeAll => translate('seeAll');
  String get problemsSolved => translate('problemsSolved');
  String get currentStreak => translate('currentStreak');
  String get easy => translate('easy');
  String get medium => translate('medium');
  String get hard => translate('hard');
  String get description => translate('description');
  String get solution => translate('solution');
  String get yourSolution => translate('yourSolution');
  String get submitSolution => translate('submitSolution');
  String get solutionPassed => translate('solutionPassed');
  String get solutionStatus => translate('solutionStatus');
  String get output => translate('output');
  String get hint => translate('hint');
  String get testCases => translate('testCases');
  String get input => translate('input');
  String get expectedOutput => translate('expectedOutput');
  String get leaderboard => translate('leaderboard');
  String get points => translate('points');
  String get submissionHistory => translate('submissionHistory');
  String get passed => translate('passed');
  String get failed => translate('failed');
  String get pending => translate('pending');
  String get noHistoryYet => translate('noHistoryYet');
  String get startSolving => translate('startSolving');
  String get settings => translate('settings');
  String get helpCenter => translate('helpCenter');
  String get logout => translate('logout');
  String get logoutConfirmTitle => translate('logoutConfirmTitle');
  String get logoutConfirmMessage => translate('logoutConfirmMessage');
  String get cancel => translate('cancel');
  String get login => translate('login');
  String get register => translate('register');
  String get email => translate('email');
  String get password => translate('password');
  String get confirmPassword => translate('confirmPassword');
  String get name => translate('name');
  String get welcomeBack => translate('welcomeBack');
  String get createAccount => translate('createAccount');
  String get dontHaveAccount => translate('dontHaveAccount');
  String get alreadyHaveAccount => translate('alreadyHaveAccount');
  String get searchProblems => translate('searchProblems');
  String get noProblemsFound => translate('noProblemsFound');
  String get failedToLoad => translate('failedToLoad');
  String get retry => translate('retry');
  String get python => translate('python');
  String get writeCodeHere => translate('writeCodeHere');
  String get totalPoints => translate('totalPoints');
  String get rank => translate('rank');
  String get goodMorning => translate('goodMorning');
  String get goodAfternoon => translate('goodAfternoon');
  String get goodEvening => translate('goodEvening');
  String get noProblemsAvailable => translate('noProblemsAvailable');
  String get errorLoadingExercises => translate('errorLoadingExercises');
  String get failedToLoadProblems => translate('failedToLoadProblems');
  String get failedToLoadLeaderboard => translate('failedToLoadLeaderboard');
  String get noLeaderboardData => translate('noLeaderboardData');
  String get pleaseEnterCode => translate('pleaseEnterCode');
  String get noProblemSelected => translate('noProblemSelected');
  String get activity => translate('activity');
  String get editProfile => translate('editProfile');
  String get notifications => translate('notifications');
  String get language => translate('language');
  String get darkMode => translate('darkMode');
  String get privacySecurity => translate('privacySecurity');
  String get selectLanguage => translate('selectLanguage');
  String get english => translate('english');
  String get arabic => translate('arabic');
  String get solved => translate('solved');
  String get pleaseEnterAllFields => translate('pleaseEnterAllFields');
  String get passwordsDoNotMatch => translate('passwordsDoNotMatch');
  String get forgotPassword => translate('forgotPassword');
  String get loginToContinue => translate('loginToContinue');
  String get startYourJourney => translate('startYourJourney');
  String get fullName => translate('fullName');
  String get hello => translate('hello');
  String get masterYourSkills => translate('masterYourSkills');
  String get onboardingTitle1 => translate('onboardingTitle1');
  String get onboardingDesc1 => translate('onboardingDesc1');
  String get onboardingTitle2 => translate('onboardingTitle2');
  String get onboardingDesc2 => translate('onboardingDesc2');
  String get onboardingTitle3 => translate('onboardingTitle3');
  String get onboardingDesc3 => translate('onboardingDesc3');
  String get next => translate('next');
  String get skip => translate('skip');
  String get getStarted => translate('getStarted');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
