import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chính sách bảo mật')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CHÍNH SÁCH BẢO MẬT',
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
            const Text(
              'Chúng tôi cam kết bảo vệ thông tin cá nhân mà bạn chia sẻ khi '
              'sử dụng ứng dụng Petter.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _buildSection(
              '1. Thông tin chúng tôi thu thập',
              '- Thông tin trực tiếp: Họ tên, email, số điện thoại, ảnh đại '
                  'diện, tin nhắn.\n- Thông tin tự động: Vị trí gần '
                  'đúng, lịch sử hoạt động, thông tin thiết bị.',
            ),
            _buildSection(
              '2. Mục đích sử dụng',
              'Quản lý tài khoản, kết nối người dùng qua tin nhắn, gửi thông '
                  'báo đẩy và cải thiện hiệu năng ứng dụng.',
            ),
            _buildSection(
              '3. Chia sẻ thông tin',
              'Chúng tôi không bán thông tin của bạn. Thông tin chỉ chia sẻ '
                  'với nhà cung cấp dịch vụ kỹ thuật (Firebase, Supabase) '
                  'hoặc theo yêu cầu pháp lý.',
            ),
            _buildSection(
              '4. Lưu trữ và bảo mật',
              'Dữ liệu được mã hóa truyền tải (TLS/HTTPS). Sau khi xóa tài khoản, dữ liệu sẽ được '
                  'xóa hoàn toàn trong vòng 30 ngày.',
            ),
            _buildSection(
              '5. Quyền của bạn',
              'Bạn có quyền truy cập, chỉnh sửa, yêu cầu xóa dữ liệu hoặc '
                  'rút quyền truy cập vị trí bất kỳ lúc nào.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Mọi thắc mắc vui lòng gửi về: hvhan.dev@gmail.com',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
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
