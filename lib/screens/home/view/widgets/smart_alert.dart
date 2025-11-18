import 'package:flutter/material.dart';

class SmartAlert extends StatelessWidget {
  const SmartAlert({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/alert.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Smart alerts',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),

          /// ALERT 1
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xff62451C),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/bxs_error.png',
                  width: 17,
                  height: 17,
                ),
                const SizedBox(width: 5),

                /// Prevent overflow
                Expanded(
                  child: Text(
                    'Your spending on food has increased by 20% compared to last week.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 7,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// ALERT 2
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xff0F3A1B),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/lets-icons_lamp-fill.png',
                  width: 17,
                  height: 17,
                ),
                const SizedBox(width: 5),

                /// Prevent overflow
                const Expanded(
                  child: Text(
                    'There are 8 days left until the end of the month and 40% of the budget remains.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
