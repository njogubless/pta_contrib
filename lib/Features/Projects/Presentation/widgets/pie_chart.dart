import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pta_contrib/Features/Projects/Data/model/model.dart';


class ContributionPieChart extends StatelessWidget {
  final Project project;

  const ContributionPieChart({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final contributedAmount = project.currentAmount;
    final remainingAmount = project.targetAmount - contributedAmount;
    final progressPercentage = (contributedAmount / project.targetAmount) * 100;

    return SizedBox(
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 60,
              sections: [
                PieChartSectionData(
                  color: Colors.green.shade400,
                  value: contributedAmount,
                  title: 'Contributed',
                  radius: 50,
                  titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.grey.shade300,
                  value: remainingAmount > 0 ? remainingAmount : 0,
                  title: 'Target',
                  radius: 50,
                   titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ],
            ),
          ),
          Text(
            '${progressPercentage.toStringAsFixed(1)}%',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}