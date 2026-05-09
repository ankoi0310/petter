import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:petter/core/extensions/build_context_extension.dart';
import 'package:petter/features/user/domain/entities/faq_category.dart';
import 'package:petter/features/user/domain/entities/faq_item.dart';
import 'package:petter/features/user/presentation/widgets/faq_tile.dart';

const List<FaqCategory> faqData = [
  FaqCategory(
    title: 'Nhận nuôi thú cưng',
    items: [
      FaqItem(
        question: 'Làm thế nào để nhận nuôi một bé thú cưng?',
        answer:
            'Bạn chỉ cần duyệt danh sách thú cưng đang cần mái ấm, chọn bé bạn yêu thích rồi nhấn "Gửi yêu cầu nhận nuôi". Người đăng tin sẽ xem xét và liên hệ lại với bạn qua tính năng nhắn tin trong app.',
      ),
      FaqItem(
        question: 'Nhận nuôi có mất phí không?',
        answer:
            'Ứng dụng hoàn toàn miễn phí. Tuy nhiên, một số người đăng tin có thể yêu cầu phí tiêm phòng hoặc triệt sản — điều này sẽ được ghi rõ trong bài đăng.',
      ),
      FaqItem(
        question: 'Tôi có thể nhận nuôi nhiều bé cùng lúc không?',
        answer:
            'Có! Bạn có thể gửi yêu cầu cho nhiều bé khác nhau. Tuy nhiên, hãy đảm bảo bạn có đủ điều kiện chăm sóc cho tất cả các bé một cách chu đáo nhé.',
      ),
      FaqItem(
        question: 'Yêu cầu của tôi bị từ chối, tôi phải làm gì?',
        answer:
            'Người đăng tin có quyền từ chối yêu cầu mà không cần giải thích. Bạn có thể nhắn tin hỏi lý do hoặc tiếp tục tìm kiếm các bé khác phù hợp hơn.',
      ),
    ],
  ),
  FaqCategory(
    title: 'Đăng tin tìm nhà',
    items: [
      FaqItem(
        question: 'Tôi có thể đăng tin nhận nuôi miễn phí không?',
        answer:
            'Hoàn toàn miễn phí! Bạn chỉ cần đăng ký tài khoản, sau đó nhấn "Đăng tin" và điền đầy đủ thông tin về bé thú cưng.',
      ),
      FaqItem(
        question: 'Tôi nên đăng những thông tin gì về thú cưng?',
        answer:
            'Hãy cung cấp đầy đủ: tên/biệt danh, loài, giống, tuổi, giới tính, tình trạng sức khỏe (đã tiêm/triệt sản chưa), tính cách và ảnh rõ nét. Thông tin càng chi tiết, bé càng dễ tìm được mái ấm.',
      ),
      FaqItem(
        question: 'Bài đăng của tôi bị ẩn hoặc xóa vì sao?',
        answer:
            'Bài đăng có thể bị ẩn nếu vi phạm điều khoản như: thông tin không trung thực, nghi ngờ mua bán trá hình, hoặc nội dung không phù hợp. Bạn có thể liên hệ hỗ trợ để được giải đáp.',
      ),
    ],
  ),
  FaqCategory(
    title: 'Nhắn tin & Liên lạc',
    items: [
      FaqItem(
        question: 'Làm sao để nhắn tin với người đăng tin?',
        answer:
            'Sau khi gửi yêu cầu nhận nuôi, bạn sẽ thấy nút "Nhắn tin" xuất hiện trong trang chi tiết bài đăng. Bạn cũng có thể vào mục "Tin nhắn" để xem tất cả cuộc trò chuyện.',
      ),
      FaqItem(
        question:
            'Tôi không nhận được tin nhắn phản hồi, phải làm gì?',
        answer:
            'Hãy kiểm tra mục thông báo và đảm bảo bạn đã bật thông báo trong cài đặt. Nếu người đăng không phản hồi sau vài ngày, bạn có thể thử nhắn tin lại hoặc tìm bé khác.',
      ),
      FaqItem(
        question:
            'Tôi có thể báo cáo người dùng có hành vi không phù hợp không?',
        answer:
            'Có. Trong cuộc trò chuyện hoặc trang hồ sơ người dùng, nhấn biểu tượng ⋮ và chọn "Báo cáo". Chúng tôi sẽ xem xét và xử lý trong vòng 24–48 giờ.',
      ),
    ],
  ),
  FaqCategory(
    title: 'Tài khoản & Bảo mật',
    items: [
      FaqItem(
        question: 'Tôi quên mật khẩu, phải làm sao?',
        answer:
            'Tại màn hình đăng nhập, nhấn "Quên mật khẩu?" và nhập email đã đăng ký. Chúng tôi sẽ gửi link đặt lại mật khẩu vào hộp thư của bạn.',
      ),
      FaqItem(
        question: 'Tôi có thể xóa tài khoản không?',
        answer:
            'Có. Vào Cài đặt → Tài khoản → Xóa tài khoản. Lưu ý rằng toàn bộ dữ liệu bao gồm bài đăng và tin nhắn sẽ bị xóa vĩnh viễn và không thể khôi phục.',
      ),
      FaqItem(
        question: 'Thông tin cá nhân của tôi có được bảo mật không?',
        answer:
            'Chúng tôi cam kết bảo mật thông tin của bạn. Dữ liệu được mã hóa và không bao giờ bán cho bên thứ ba. Xem thêm tại Chính sách bảo mật trong ứng dụng.',
      ),
    ],
  ),
];

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<FaqCategory> get _filtered {
    if (_query.isEmpty) return faqData;

    final q = _query.toLowerCase();
    return faqData
        .map(
          (category) => FaqCategory(
            title: category.title,
            items: category.items
                .where(
                  (item) =>
                      item.question.toLowerCase().contains(q) ||
                      item.answer.toLowerCase().contains(q),
                )
                .toList(),
          ),
        )
        .where((category) => category.items.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Scaffold(
      appBar: AppBar(title: const Text('Câu hỏi thường gặp')),
      body: SafeArea(
        child: Column(
          spacing: 24,
          children: [
            Container(
              padding: const .symmetric(horizontal: 16),
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    'Chúng tôi có thể giúp gì cho bạn?',
                    style: context.textTheme.titleLarge,
                  ),
                  TextField(
                    controller: _searchController,
                    onChanged: (v) {
                      setState(() => _query = v.trim());
                    },
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm câu hỏi...',
                      prefixIcon: const Icon(
                        Iconsax.search_normal_copy,
                      ),
                      suffixIcon: _query.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _query = '');
                              },
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          Text(
                            'Không tìm thấy kết quả cho\n"$_query"',
                            textAlign: .center,
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const .symmetric(horizontal: 16),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final category = filtered[index];
                        return Column(
                          crossAxisAlignment: .start,
                          children: [
                            Padding(
                              padding: const .only(bottom: 8, top: 4),
                              child: Text(
                                category.title,
                                style: context.textTheme.labelLarge,
                              ),
                            ),
                            ...category.items.map((item) {
                              return FaqTile(
                                item: item,
                                searchQuery: _query,
                              );
                            }),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
