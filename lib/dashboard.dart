import 'package:flutter/material.dart';

import 'auth_service.dart';

const Color _summaryCardBorderColor = Color(0xFFE4E7EC);
const Color _summaryCardShadowColor = Color(0x140F172A);

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final Future<String> _userNameFuture = _loadUserName();
  int _selectedNavIndex = 0;

  Future<String> _loadUserName() async {
    try {
      await authService.value.currentUser?.reload();
      final String userName =
          authService.value.currentUser?.displayName?.trim() ?? '';
      return userName.isEmpty ? 'there' : userName;
    } catch (_) {
      return 'there';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      bottomNavigationBar: _DashboardBottomNavigationBar(
        selectedIndex: _selectedNavIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<String>(
                          future: _userNameFuture,
                          builder: (context, snapshot) {
                            final String userName = snapshot.data ?? 'there';

                            return Text(
                              'Hi, $userName',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Ready to find your calm?',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.settings),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: _summaryCardBorderColor),
                        boxShadow: const [
                          BoxShadow(
                            color: _summaryCardShadowColor,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF1E8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.local_fire_department,
                              color: Colors.deepOrange,
                              size: 22,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '5',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2F3A4F),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Day Streak',
                            style: TextStyle(
                              color: Color(0xFF8C94A6),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: _summaryCardBorderColor),
                        boxShadow: const [
                          BoxShadow(
                            color: _summaryCardShadowColor,
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 36,
                            width: 36,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF7DA),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.emoji_events,
                              color: Color(0xFFDAA300),
                              size: 22,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '1 / 2',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2F3A4F),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Daily Goals',
                            style: TextStyle(
                              color: Color(0xFF8C94A6),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFDCE8F8)),
                  boxShadow: const [
                    BoxShadow(
                      color: _summaryCardShadowColor,
                      blurRadius: 14,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Current Stress Level',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2F3A4F),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F2E4),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: const Text(
                            'Low',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF4E8A56),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Center(
                      child: Container(
                        height: 182,
                        width: 182,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF2F3A4F),
                            width: 1.4,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '35',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2F3A4F),
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Low Stress',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF7B8597),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 34),
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'AI Confidence',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8C94A6),
                            ),
                          ),
                        ),
                        Text(
                          '92 %',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8C94A6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: LinearProgressIndicator(
                        value: 0.92,
                        minHeight: 8,
                        backgroundColor: const Color(0xFFE6E9EF),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF6B9BDA),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Icon(
                          Icons.trending_down,
                          size: 18,
                          color: Color(0xFF77C56E),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Trending down from yesterday',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF7B8597),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Row(
                children: [
                  const Icon(
                    Icons.track_changes,
                    color: Color(0xFF6B9BDA),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      "Today's Goals",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F3A4F),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                    ),
                    onPressed: () {
                      _setDailyGoals(context);
                    },
                    child: Text(
                      'Change Goals',
                      style: TextStyle(color: Color(0xFF6B9BDA), fontSize: 13),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _summaryCardBorderColor),
                  boxShadow: const [
                    BoxShadow(
                      color: _summaryCardShadowColor,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F6FC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.air_rounded,
                        color: Color(0xFF6B9BDA),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Practice Breathing",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F3A4F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _summaryCardBorderColor),
                  boxShadow: const [
                    BoxShadow(
                      color: _summaryCardShadowColor,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: SizedBox(
                          height: 22,
                          width: 22,
                          child: CustomPaint(
                            painter: _StressLevelPulsePainter(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Check Stress Levels",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F3A4F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFF6DEC5)),
                  boxShadow: const [
                    BoxShadow(
                      color: _summaryCardShadowColor,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF4EA),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.lightbulb_outline_rounded,
                            color: Color(0xFFF0A25C),
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Tip",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2F3A4F),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Take a break from screens for 15 minutes.',
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.45,
                                  color: Color(0xFF475467),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 15, height: 1.5),
                        children: [
                          TextSpan(
                            text: 'Try this: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFF0A25C),
                            ),
                          ),
                          TextSpan(
                            text:
                                'Digital overload contributes to mental fatigue and stress.',
                            style: TextStyle(color: Color(0xFF667085)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "You're doing great today!",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF77B96C),
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.spa_outlined,
                      size: 18,
                      color: Color(0xFF77B96C),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _StressLevelPulsePainter extends CustomPainter {
  const _StressLevelPulsePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFF09AA3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.9
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final Path pulsePath = Path()
      ..moveTo(size.width * 0.08, size.height * 0.58)
      ..lineTo(size.width * 0.24, size.height * 0.58)
      ..lineTo(size.width * 0.34, size.height * 0.68)
      ..lineTo(size.width * 0.46, size.height * 0.24)
      ..lineTo(size.width * 0.60, size.height * 0.78)
      ..lineTo(size.width * 0.72, size.height * 0.42)
      ..lineTo(size.width * 0.92, size.height * 0.42);

    canvas.drawPath(pulsePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TherapyBrainPainter extends CustomPainter {
  const _TherapyBrainPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF85B894)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final Path leftOuter = Path()
      ..moveTo(size.width * 0.49, size.height * 0.20)
      ..cubicTo(
        size.width * 0.34,
        size.height * 0.10,
        size.width * 0.20,
        size.height * 0.22,
        size.width * 0.24,
        size.height * 0.39,
      )
      ..cubicTo(
        size.width * 0.10,
        size.height * 0.44,
        size.width * 0.11,
        size.height * 0.65,
        size.width * 0.25,
        size.height * 0.68,
      )
      ..cubicTo(
        size.width * 0.20,
        size.height * 0.86,
        size.width * 0.42,
        size.height * 0.94,
        size.width * 0.49,
        size.height * 0.77,
      )
      ..lineTo(size.width * 0.49, size.height * 0.20);

    final Path rightOuter = Path()
      ..moveTo(size.width * 0.51, size.height * 0.20)
      ..cubicTo(
        size.width * 0.66,
        size.height * 0.10,
        size.width * 0.80,
        size.height * 0.22,
        size.width * 0.76,
        size.height * 0.39,
      )
      ..cubicTo(
        size.width * 0.90,
        size.height * 0.44,
        size.width * 0.89,
        size.height * 0.65,
        size.width * 0.75,
        size.height * 0.68,
      )
      ..cubicTo(
        size.width * 0.80,
        size.height * 0.86,
        size.width * 0.58,
        size.height * 0.94,
        size.width * 0.51,
        size.height * 0.77,
      )
      ..lineTo(size.width * 0.51, size.height * 0.20);

    final Path leftFold = Path()
      ..moveTo(size.width * 0.36, size.height * 0.28)
      ..cubicTo(
        size.width * 0.26,
        size.height * 0.30,
        size.width * 0.28,
        size.height * 0.45,
        size.width * 0.39,
        size.height * 0.45,
      )
      ..cubicTo(
        size.width * 0.26,
        size.height * 0.48,
        size.width * 0.29,
        size.height * 0.64,
        size.width * 0.42,
        size.height * 0.61,
      );

    final Path rightFold = Path()
      ..moveTo(size.width * 0.64, size.height * 0.28)
      ..cubicTo(
        size.width * 0.74,
        size.height * 0.30,
        size.width * 0.72,
        size.height * 0.45,
        size.width * 0.61,
        size.height * 0.45,
      )
      ..cubicTo(
        size.width * 0.74,
        size.height * 0.48,
        size.width * 0.71,
        size.height * 0.64,
        size.width * 0.58,
        size.height * 0.61,
      );

    canvas.drawPath(leftOuter, paint);
    canvas.drawPath(rightOuter, paint);
    canvas.drawPath(leftFold, paint);
    canvas.drawPath(rightFold, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DashboardBottomNavigationBar extends StatelessWidget {
  const _DashboardBottomNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFF1F3F5))),
          boxShadow: [
            BoxShadow(
              color: Color(0x120F172A),
              blurRadius: 18,
              offset: Offset(0, -4),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: Row(
          children: [
            _BottomNavItem(
              icon: Icons.home_outlined,
              label: 'Home',
              isSelected: selectedIndex == 0,
              onTap: () => onDestinationSelected(0),
            ),
            _BottomNavItem(
              icon: Icons.monitor_heart_outlined,
              label: 'Tracking',
              isSelected: selectedIndex == 1,
              onTap: () => onDestinationSelected(1),
            ),
            _BottomNavItem(
              icon: Icons.local_florist_outlined,
              label: 'Therapy',
              isSelected: selectedIndex == 2,
              onTap: () => onDestinationSelected(2),
            ),
            _BottomNavItem(
              icon: Icons.sports_esports_outlined,
              label: 'Games',
              isSelected: selectedIndex == 3,
              onTap: () => onDestinationSelected(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color itemColor = isSelected
        ? const Color(0xFF6B9BDA)
        : const Color(0xFF98A2B3);

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: itemColor, size: 24),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: itemColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _setDailyGoals(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 15,
          left: 24,
          right: 24,
          bottom: 24,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 10),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Set Your Daily Goals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Choose 2 goals to focus on today',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFE4EAF2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 242, 246, 252),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.air_rounded,
                      color: Color(0xFF6B9BDA),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Practice Breathing",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F3A4F),
                          ),
                        ),
                        Text(
                          'Complete a breathing exercise',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF667085),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFE4EAF2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(197, 242, 246, 252),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: SizedBox(
                        height: 22,
                        width: 22,
                        child: CustomPaint(
                          painter: _StressLevelPulsePainter(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Check Stress Levels",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F3A4F),
                          ),
                        ),
                        Text(
                          'Monitor your stress biomarkers',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF667085),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFE4EAF2),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F6F1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CustomPaint(
                          painter: _TherapyBrainPainter(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Try a Therapy Technique",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F3A4F),
                          ),
                        ),
                        Text(
                          'Use mindfulness or cognitive reframing',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF667085),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
