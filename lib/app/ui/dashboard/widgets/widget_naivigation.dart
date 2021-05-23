import 'package:flutter/material.dart';
import 'package:flutter_sales_management/app/constants/constants.dart';

class WidgetNavigationDashboard extends StatelessWidget {
  final double width;
  final double? padding;

  const WidgetNavigationDashboard(
      {Key? key, required this.width, this.padding = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: Colors.black,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                _buildItem(Icons.home_mini, 'Home', () {}),
                const SizedBox(
                  height: 16,
                ),
                _buildItem(Icons.search, 'Search', () {})
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(IconData icon, String msg, Function onTap) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding ?? 0,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon),
              const SizedBox(
                width: 6,
              ),
              Text(
                msg,
                style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
