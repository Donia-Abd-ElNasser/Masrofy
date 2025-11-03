 import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

PieChartSectionData pieSection(double value, Color color) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: 45,
      showTitle: false,
    );
  }