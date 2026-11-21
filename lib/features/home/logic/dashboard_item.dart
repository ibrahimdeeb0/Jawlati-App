import 'package:flutter/material.dart';
import 'package:jawlati/core/helpers/extensions.dart';
import 'package:jawlati/core/navigation/app_router_constants.dart';

class DashboardItem {
  final IconData icon;
  final String label;
  final void Function(BuildContext context) onPressed;
  final List<Color> gradientColors;

  DashboardItem({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.gradientColors,
  });
}

final List<DashboardItem> dashboardItems = [
  DashboardItem(
    icon: Icons.format_list_bulleted,
    label: 'إضافة فاتورة',
    onPressed: (context) => context.pushNamed(AppRouterConstants.addInvoice),
    gradientColors: [Colors.deepOrange, Colors.orangeAccent],
  ),
  DashboardItem(
    icon: Icons.receipt_long,
    label: 'عرض الفواتير',
    onPressed: (context) => context.pushNamed(AppRouterConstants.viewInvoices),
    gradientColors: [Colors.orange, Colors.deepOrange],
  ),
  DashboardItem(
    icon: Icons.rotate_left,
    label: 'إضافة مرتجع',
    onPressed: (context) =>
        context.pushNamed(AppRouterConstants.addReturnInvoice),
    gradientColors: [Colors.redAccent, Colors.deepOrangeAccent],
  ),
  DashboardItem(
    icon: Icons.assignment_return,
    label: 'عرض المرتجع',
    onPressed: (context) =>
        context.pushNamed(AppRouterConstants.viewReturnInvoices),
    gradientColors: [Colors.red, Colors.redAccent],
  ),
  DashboardItem(
    icon: Icons.person_add,
    label: 'إضافة عميل',
    onPressed: (context) => context.pushNamed(AppRouterConstants.addClient),
    gradientColors: [Colors.teal, Colors.cyan],
  ),
  DashboardItem(
    icon: Icons.group,
    label: 'عرض العملاء',
    onPressed: (context) => context.pushNamed(AppRouterConstants.viewClients),
    gradientColors: [Colors.indigo, Colors.deepPurple],
  ),
  DashboardItem(
    icon: Icons.money,
    label: 'إضافة سند قبض',
    onPressed: (context) => context.pushNamed(AppRouterConstants.addReceipt),
    gradientColors: [Colors.green, Colors.lightGreen],
  ),
  DashboardItem(
    icon: Icons.receipt,
    label: 'سندات القبض',
    onPressed: (context) => context.pushNamed(AppRouterConstants.viewReceipts),
    gradientColors: [Colors.lightGreen, Colors.greenAccent],
  ),
  DashboardItem(
    icon: Icons.receipt_long,
    label: 'إدارة الطلبات',
    onPressed: (context) => context.pushNamed(AppRouterConstants.myRequests),
    gradientColors: [Colors.cyan, Colors.lightBlue],
  ),
  DashboardItem(
    icon: Icons.inventory,
    label: 'جرد المستودع',
    onPressed: (context) => context.pushNamed(AppRouterConstants.inventoryQuantities),
    gradientColors: [Colors.brown, Colors.orange],
  ),
  DashboardItem(
    icon: Icons.access_time,
    label: 'بصمة الدوام',
    onPressed: (context) {},
    gradientColors: [Colors.blueGrey, Colors.grey],
  ),
];
