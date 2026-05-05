import 'package:flutter/material.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Điều khoản sử dụng')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ĐIỀU KHOẢN SỬ DỤNG',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ứng dụng Petter | Cập nhật lần cuối: 05/05/2025',
            ),
            const Divider(height: 32),
            _buildSection(
              '1. Giới thiệu về Petter',
              'Petter là nền tảng phi thương mại kết nối người có thú cưng '
                  'cần tìm nhà mới với những người muốn nhận nuôi...[cite: 1]',
            ),
            _buildSection(
              '2. Điều kiện sử dụng',
              '2.1 Yêu cầu về người dùng: Bạn phải từ 16 tuổi trở lên, '
                  'thông tin chính xác, mỗi người một tài khoản[cite: 1].\n'
                  '2.2 Tài khoản: Bạn chịu hoàn toàn trách nhiệm về mọi hoạt '
                  'động dưới tài khoản của mình[cite: 1].',
            ),
            _buildSection(
              '3. Quy tắc đăng tin',
              'Được phép đăng tin tìm nhà cho thú cưng thực tế, thông tin '
                  'sức khỏe trung thực[cite: 1].\nNghiêm cấm: Mua bán vì '
                  'lợi nhuận, đăng động vật hoang dã, sử dụng ảnh giả mạo '
                  'hoặc thu phí đặt cọc[cite: 1].',
            ),
            _buildSection(
              '4. Quy tắc cộng đồng',
              'Giữ thái độ tôn trọng, không spam, không quấy rối hoặc chia sẻ '
                  'thông tin cá nhân người khác[cite: 1].',
            ),
            _buildSection(
              '7. Giới hạn trách nhiệm',
              'Petter không kiểm chứng từng thú cưng hay người dùng, không '
                  'chịu trách nhiệm về kết quả nhận nuôi hoặc hành vi của '
                  'người dùng[cite: 1].',
            ),
            const SizedBox(height: 20),
            const Text('Liên hệ: hvhan.dev@gmail.com[cite: 1]'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const .only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}
