// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/onboarding_data.dart';
import '../screens/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      image: 'assets/images/onboarding_one.png',
      title: 'Your Finances\nSimplified by AI',
      subtitle: 'Track, Save & Grow Smarter',
    ),
    OnboardingData(
      image: 'assets/images/onboarding_two.png',
      title: 'Smarter Spending\nStarts Here',
      subtitle: 'Experience AI-Powered Money\nManagement',
    ),
    OnboardingData(
      image: 'assets/images/oboarding_three.png',
      title: 'Your Finances\nSimplified by AI',
      subtitle: 'Spend Less. Save More. Live Better.',
    ),
  ];

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _finishOnboarding() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const WelcomeScreen()));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: TextButton(
                  onPressed: _finishOnboarding,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Image
                      Container(
                        height: 420,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 100,
                              spreadRadius: 8,
                              offset: const Offset(0, 25),
                            ),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            _pages[index].image,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Page indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_pages.length, (index) {
                          final bool isActive = _currentPage == index;
                          const duration = Duration(milliseconds: 300);
                          const curve = Curves.easeOutCubic;

                          if (isActive) {
                            return AnimatedContainer(
                              duration: duration,
                              curve: curve,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: 26,
                              height: 26,
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: duration,
                                    curve: curve,
                                    width: isActive ? 18 : 16,
                                    height: isActive ? 18 : 16,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[350],
                                    ),
                                  ),
                                  AnimatedOpacity(
                                    duration: duration,
                                    opacity: isActive ? 1.0 : 0.0,
                                    curve: curve,
                                    child: AnimatedContainer(
                                      duration: duration,
                                      curve: curve,
                                      width: isActive ? 14 : 12,
                                      height: isActive ? 14 : 12,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: duration,
                                    curve: curve,
                                    width: isActive ? 12 : 6,
                                    height: isActive ? 12 : 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return AnimatedContainer(
                              duration: duration,
                              curve: curve,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[600],
                              ),
                            );
                          }
                        }),
                      ),

                      const SizedBox(height: 16),

                      // Title
                      Text(
                        _pages[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Subtitle
                      Text(
                        _pages[index].subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: _currentPage == 0 ? 70 : 160,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: _currentPage == 0
                        ? InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: _nextPage,
                            child: Center(
                              child: Image.asset(
                                'assets/images/arrow_right.png',
                                width: 18,
                                height: 18,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  onTap: _currentPage > 0
                                      ? _previousPage
                                      : null,
                                  child: Center(
                                    child: Opacity(
                                      opacity: _currentPage > 0 ? 1.0 : 0.3,
                                      child: Image.asset(
                                        'assets/images/arrow_left.png',
                                        width: 18,
                                        height: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Divider
                              Container(
                                width: 1,
                                height: 28,
                                color: Colors.grey[200],
                              ),

                              // Right arrow
                              Expanded(
                                child: InkWell(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  onTap: _nextPage,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/arrow_right.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
