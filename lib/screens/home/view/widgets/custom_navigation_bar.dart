import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:masrofy/core/constants.dart';
import 'package:masrofy/core/routes.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Builder(
            builder: (context) {
              final String location = GoRouterState.of(context).uri.toString();
              int selectedIndex = 0;
              if (location.startsWith(AppRoutes.kReportsView)) {
                selectedIndex = 1;
              }
              if (location.startsWith(AppRoutes.kTransactionView)) {
                selectedIndex = 2;
              }
              if (location.startsWith(AppRoutes.kBudgetView)) {
                selectedIndex = 3;
              }
              if (location.startsWith(AppRoutes.kProfileView)) selectedIndex = 4;

              return BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      (context).go(AppRoutes.kHomeView);
                      break;
                    case 1:
                      (context).go(AppRoutes.kReportsView);
                      break;
                    case 2:
                      (context).go(AppRoutes.kTransactionView);
                      break;
                    case 3:
                      (context).go(AppRoutes.kBudgetView);
                      break;
                    case 4:
                      (context).go(AppRoutes.kProfileView);
                      break;
                  }
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: kPrimaryColor,
                elevation: 0,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  NavigationItem(FontAwesomeIcons.house, selectedIndex == 0),
                  NavigationItem(FontAwesomeIcons.chartColumn, selectedIndex == 1),
                  CenterItem(selectedIndex == 2),
                  NavigationItem(Icons.list_rounded, selectedIndex == 3),
                  NavigationItem(Icons.person, selectedIndex == 4),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
BottomNavigationBarItem CenterItem(bool isSelected) {
  return BottomNavigationBarItem(
    icon: Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? kGreyColor : Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.add,
        color: isSelected ? Colors.black : kGreyColor,
        size: 22,
      ),
    ),
    label: "",
  );
}BottomNavigationBarItem NavigationItem(IconData icon, bool isSelected) {
  return BottomNavigationBarItem(
    icon: Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? kGreyColor : Colors.transparent,
      ),
      child: Icon(
        icon,
        size: 20,
        color: isSelected ? Colors.black : Colors.grey,
      ),
    ),
    label: "",
  );
}
