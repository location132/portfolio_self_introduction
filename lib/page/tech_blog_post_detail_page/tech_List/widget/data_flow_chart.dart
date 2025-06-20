import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataFlowChart extends StatelessWidget {
  final bool isBackgroundColor;
  final List<String> flowSteps;
  final bool isLastStep;
  final bool isMobile;

  const DataFlowChart({
    super.key,
    required this.isBackgroundColor,
    required this.flowSteps,
    this.isLastStep = true,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 16,
      children: _buildFlowSteps(),
    );
  }

  List<Widget> _buildFlowSteps() {
    List<Widget> widgets = [];

    for (int i = 0; i < flowSteps.length; i++) {
      widgets.add(_buildFlowStep(flowSteps[i], i));

      if (i < flowSteps.length - 1) {
        widgets.add(_buildArrow());
      }
    }

    return widgets;
  }

  Widget _buildFlowStep(String title, int index) {
    bool isCurrentLastStep = isLastStep && (index == flowSteps.length - 1);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10.w : 15,
        vertical: isMobile ? 5.w : 10,
      ),
      decoration: BoxDecoration(
        color: isBackgroundColor ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(isMobile ? 11.w : 11),
        border: Border.all(
          color:
              isCurrentLastStep
                  ? Color.fromARGB(255, 140, 245, 134)
                  : (isBackgroundColor ? Colors.black : Colors.white),
          width: 1.5,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isBackgroundColor ? Colors.black : Colors.white,
          fontSize: isMobile ? 12.sp : 14,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildArrow() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: isBackgroundColor ? Colors.black : Colors.white,
      size: isMobile ? 24.sp : 24,
    );
  }
}
