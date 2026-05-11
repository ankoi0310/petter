import 'package:intl/intl.dart';

extension CurrencyFormatting on num {
  /// 1,000
  String toDecimal({String locale = 'en'}) {
    return NumberFormat.decimalPattern(locale).format(this);
  }

  /// 1,000.50
  String toDecimal2({String locale = 'en'}) {
    return NumberFormat('#,##0.00', locale).format(this);
  }

  /// $1,000.50
  String toCurrency({String locale = 'vi_VN', String symbol = 'đ'}) {
    return NumberFormat.currency(
      locale: locale,
      symbol: symbol,
    ).format(this);
  }

  /// 1.000 ₫
  String toVND() {
    return NumberFormat.currency(
      locale: 'vi_VN',
      symbol: '₫',
      decimalDigits: 0,
    ).format(this);
  }

  /// 50%
  String toPercent({String locale = 'en'}) {
    return NumberFormat.percentPattern(locale).format(this);
  }
}

extension AgeFormatter on int? {
  String toAgeString() {
    if (this == null || this! <= 0) return '-';

    final years = this! ~/ 12; // Chia lấy nguyên để tìm số năm
    final months = this! % 12; // Chia lấy dư để tìm số tháng còn lại

    final parts = <String>[];

    if (years > 0) {
      parts.add('$years năm');
    }

    if (months > 0) {
      parts.add('$months tháng');
    }

    // Kết hợp các phần bằng khoảng cách
    return parts.isNotEmpty ? parts.join(' ') : '-';
  }
}

extension WeightFormatter on double? {
  String toWeightString() {
    if (this == null || this == 0) return '-';

    // Nếu số đó chia hết cho 1 (tức là phần thập phân bằng 0)
    if (this! % 1 == 0) {
      return '${this!.toInt()} kg'; // Chuyển về int để mất dấu .0
    }

    // Nếu có số thập phân, giữ nguyên
    // (hoặc dùng .toStringAsFixed(1) nếu muốn giới hạn 1 chữ số)
    return '$this kg';
  }
}
