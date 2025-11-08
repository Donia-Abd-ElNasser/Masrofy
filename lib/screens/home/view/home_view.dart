import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes.dart';
import 'package:masrofy/screens/home/view/widgets/pie_and_statistics.dart';
import 'package:masrofy/screens/home/view/widgets/smart_alert.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
     
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User greeting
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          'assets/images/profile.png',
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Good Morning!",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            "Ahmed Khaled",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(FontAwesomeIcons.solidBell, color: Colors.grey),
                ],
              ),

              SizedBox(height: height * 0.03),

              // Balance card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.048),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/balance.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    SizedBox(height: height * 0.005),
                    const Text(
                      "£3,000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "from £20,000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        color: Color(0xff329EC5),
                        backgroundColor: Colors.white24,
                        minHeight: 6,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push(AppRoutes.kWalletView);
                      },
                      child: Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisAlignment: MainAxisAlignment.end,
                        
                        children: [
                         const Text(
                        "My Wallet",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 5,) ,
                                         Icon(Icons.arrow_circle_right,size:20,color: Colors.white, ),
                      
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: height * 0.012),

              // Income and Outcome
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Frame 14368.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatCard("Income", "£20,000", Colors.green, width),
                    const VerticalDivider(
                      color: Colors.white,
                      thickness: 1,
                      endIndent: 20,
                      indent: 20,
                    ),
                    StatCard("Outcome", "£17,000", Colors.red, width),
                  ],
                ),
              ),

              SizedBox(height: height * 0.012),

              //3rd
              Container(
                padding: EdgeInsets.only(right: 5, left: 20),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/Frame 14368.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset(
                          'assets/images/Group.png',
                          width: 28,
                          height: 28,
                        ),
                        SizedBox(width: 7),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Your current level: Beginner Provider 🥇',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Your current points: 1,250 ⭐',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 65),
                      ],
                    ),

                    Positioned(
                      bottom: 25,
                      right: 22,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xff53D258),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/zondicons_badge.png',
                              width: 10,
                              height: 10,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              'New badge',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.012),
              // Smart alerts
              SmartAlert(width: width),

              SizedBox(height: height * 0.012),

              // Chart &pie
              PieAndStatistics(height: height),
            ],
          ),
        ),
      ),

    );
  }

  Widget StatCard(String title, String value, Color color, double width) {
    return Container(
      width: width * 0.41,
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            title == "Income"
                ? FontAwesomeIcons.arrowDown
                : FontAwesomeIcons.arrowUp,
            color: color,
            size: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}




