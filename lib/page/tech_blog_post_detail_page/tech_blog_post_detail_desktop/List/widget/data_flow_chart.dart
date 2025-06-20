import 'package:flutter/material.dart';

class DataFlowChart extends StatelessWidget {
  final bool isBackgroundColor;
  final List<String> flowSteps;
  final bool isLastStep;

  const DataFlowChart({
    super.key,
    required this.isBackgroundColor,
    required this.flowSteps,
    this.isLastStep = true,
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isBackgroundColor ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(11),
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
          fontSize: 14,
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
      size: 24,
    );
  }
}
