import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateTimeHelper {
  static bool _isInitialized = false;

  // تهيئة تنسيق التاريخ مرة واحدة فقط
  static Future<void> initialize() async {
    if (!_isInitialized) {
      await initializeDateFormatting('ar', null);
      _isInitialized = true;
    }
  }

  // تنسيق التاريخ للفواتير
  static String formatInvoiceDate(DateTime date) {
    return DateFormat('dd/MM/yyyy - HH:mm', 'ar').format(date);
  }

  // تنسيق التاريخ المختصر
  static String formatShortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy', 'ar').format(date);
  }

  // تنسيق الوقت فقط
  static String formatTime(DateTime date) {
    return DateFormat('h:mm a', 'ar').format(date);
  }

  // تنسيق تاريخ نسبي (منذ ساعة، أمس، إلخ)
  static String formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'الآن';
    } else if (difference.inMinutes < 60) {
      return 'منذ ${difference.inMinutes} دقيقة';
    } else if (difference.inHours < 24) {
      return 'منذ ${difference.inHours} ساعة';
    } else if (difference.inDays == 1) {
      return 'أمس';
    } else if (difference.inDays < 7) {
      return 'منذ ${difference.inDays} أيام';
    } else {
      return formatShortDate(date);
    }
  }

  // تنسيق العملة
  static String formatCurrency(double amount, {String symbol = 'د.أ'}) {
    final formatter = NumberFormat('#,##0.00', 'ar');
    return '${formatter.format(amount)} $symbol';
  }

  // التحقق من كون التاريخ اليوم
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }

  // التحقق من كون التاريخ أمس
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year && 
           date.month == yesterday.month && 
           date.day == yesterday.day;
  }
}