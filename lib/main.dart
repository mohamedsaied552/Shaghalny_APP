import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/worker/worker_home_screen.dart';
import 'screens/worker/worker_profile_screen.dart';
import 'screens/worker/job_details_screen.dart';
import 'screens/worker/applied_jobs_screen.dart';
import 'screens/employer/employer_home_screen.dart';
import 'screens/employer/post_job_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ShoghlanyApp());
}

class ShoghlanyApp extends StatelessWidget {
  const ShoghlanyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoghlany',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/worker-login': (context) => const LoginScreen(role: 'Worker'),
        '/employer-login': (context) => const LoginScreen(role: 'Employer'),
        '/worker-register': (context) => const RegisterScreen(role: 'Worker'),
        '/employer-register': (context) =>
            const RegisterScreen(role: 'Employer'),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/worker-home': (context) => const WorkerHomeScreen(),
        '/worker-profile': (context) => const WorkerProfileScreen(),
        '/worker-job-details': (context) => JobDetailsScreen(
              jobId: 0, // TODO: Pass actual job ID
            ),
        '/worker-applied-jobs': (context) => const AppliedJobsScreen(),
        '/employer-home': (context) => const EmployerHomeScreen(),
        '/employer-post-job': (context) => const PostJobScreen(),
        // TODO: Add more routes for other screens
      },
    );
  }
}
