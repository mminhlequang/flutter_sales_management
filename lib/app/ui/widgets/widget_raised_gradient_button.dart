import 'package:flutter/material.dart';
import 'package:flutter_sales_management/app/constants/app_colors.dart';

class WidgetRaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final double width;
  final double height;
  final Function() onPressed;

  const WidgetRaisedGradientButton({
    Key? key,
    required this.child,
    this.gradient,
    this.borderRadius,
    this.width = 120,
    this.height = 50.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 8,
      color: Colors.black54,
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: gradient ??
              LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [PRIMARY_COLOR, PRIMARY_DARK_COLOR]),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onPressed,
              borderRadius: borderRadius,
              child: Center(
                child: child,
              )),
        ),
      ),
    );
  }
}
