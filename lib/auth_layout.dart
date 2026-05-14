import 'package:flutter/material.dart';

import 'app_loading_page.dart';
import 'auth_service.dart';
import 'dashboard.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.signedOutPage,
  });

  final Widget signedOutPage;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AuthService>(
      valueListenable: authService,
      builder: (context, auth, _) {
        return StreamBuilder(
          stream: auth.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppLoadingPage();
            }
            if (snapshot.hasData) {
              return const DashboardScreen();
            }
            return signedOutPage;
          },
        );
      },
    );
  }
}
