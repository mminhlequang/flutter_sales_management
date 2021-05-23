import 'package:flutter/material.dart';
import 'package:flutter_sales_management/app/constants/app_colors.dart';
import 'package:flutter_sales_management/app/ui/dashboard/widgets/widget_naivigation.dart';
import 'package:get/get.dart';

import '../ui.dart';

class DashBoardScreen extends BaseScreen<DashBoardController> {
  Widget _buildBody() {
    return SizedBox();
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: PRIMARY_GRADIENT),
      child: Row(
        children: [
          WidgetNavigationDashboard(
            width: Get.width / 6,
          ),
          _buildBody(),
        ],
      ),
    );
  }
}
