import 'package:flutter/material.dart';
import 'package:flutter_sales_management/app/constants/app_text_theme.dart';
import 'package:flutter_sales_management/app/constants/constants.dart';
import 'package:flutter_sales_management/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../ui.dart';

class HomeScreen extends BaseScreen<HomeController> {
  @override
  Widget buildDesktop(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Container(
      decoration: BoxDecoration(gradient: PRIMARY_GRADIENT),
      child: Center(
          child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        onPressed: () => Get.toNamed(Routes.DASHBOARD),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.dashboard_outlined,
              color: Colors.deepPurple,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'DASHBOARD',
              style: STYLE_MEDIUM_BOLD.copyWith(color: Colors.deepPurple),
            )
          ],
        ),
      )),
    );
  }
}
