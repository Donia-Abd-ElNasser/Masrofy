import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/screens/onboarding/model/onboarding_model.dart';


class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      image: 'assets/images/onboarding_one.png',
      title: 'Take Control\nOf Your Money ',
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

  void _onPageChanged(int page) => setState(() => _currentPage = page);

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
    GoRouter.of(context).pushReplacement(AppRoutes.kWelcomeView);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
    
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  top: height * 0.02,
                  right: width * 0.05,
                ),
                child: TextButton(
                  onPressed: _finishOnboarding,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: height * 0.015),

            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Column(
                        children: [
                          // Image container
                          Container(
                            height: height * 0.45,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(vertical: height * 0.015),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 80,
                                  spreadRadius: 4,
                                  offset: const Offset(0, 20),
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

                          SizedBox(height: height * 0.02),

                          // Page indicator
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(_pages.length, (i) {
                              final bool isActive = _currentPage == i;
                              const duration = Duration(milliseconds: 300);
                              const curve = Curves.easeOutCubic;

                              return AnimatedContainer(
                                duration: duration,
                                curve: curve,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                width: isActive ? width * 0.06 : width * 0.025,
                                height: isActive ? width * 0.06 : width * 0.025,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isActive ? Colors.black : Colors.grey[400],
                                ),
                              );
                            }),
                          ),

                          SizedBox(height: height * 0.03),

                          // Title
                          Text(
                            _pages[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: width * 0.075,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              height: 1.3,
                            ),
                          ),

                        SizedBox(height:8),

                          // Subtitle
                          Text(
                            _pages[index].subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: width * 0.04,
                              color: const Color.fromARGB(255, 90, 90, 90),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Navigation buttons
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: _currentPage == 0 ? width * 0.2 : width * 0.45,
                    height: height * 0.07,
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
                                width: width * 0.05,
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
                                  onTap: _previousPage,
                                  child: Center(
                                    child: Opacity(
                                      opacity: _currentPage > 0 ? 1.0 : 0.3,
                                      child: Image.asset(
                                        'assets/images/arrow_left.png',
                                        width: width * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: height * 0.035,
                                color: Colors.grey[200],
                              ),
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
                                      width: width * 0.05,
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
