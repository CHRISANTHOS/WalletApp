import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              'Total Balance',
              style: GoogleFonts.poppins(fontSize: 13),
            ),
            Text(
              '\$10000',
              style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Income Stats',
                  style: GoogleFonts.poppins(
                      fontSize: 13, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Oct - Feb',
                  style: GoogleFonts.poppins(fontSize: 13),
                ),
              ],
            ),
            Container(
              height: 180,
              child: Expanded(
                child: LineChart(
                  LineChartData(
                      lineTouchData: LineTouchData(
                          handleBuiltInTouches: false
                      ),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                            color: Colors.black45,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: false),
                            isCurved: true,
                            spots: [
                              FlSpot(0, 1),
                              FlSpot(1, 1.2),
                              FlSpot(4, 1.5),
                              FlSpot(5, 1.6),
                              FlSpot(3, 3.5),
                              FlSpot(6, 2.2)
                            ])
                      ],
                      titlesData: FlTitlesData(bottomTitles: AxisTitles()),
                      minX: 0,
                      maxX: 7,
                      minY: 3,
                      maxY: 0
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
