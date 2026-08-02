# 🎵 Thư Mục Tệp Audio (Audio Files)

Thư mục này chứa tất cả các tệp tin âm thanh phục vụ cho dự án. Vui lòng đọc kỹ các quy định định dạng và cấu trúc bên dưới trước khi thêm hoặc chỉnh sửa dữ liệu.

## 📂 Cấu Trúc Thư Mục
* **`/raw`**: Âm thanh gốc chưa qua xử lý.
* **`/processed`**: Âm thanh đã lọc tạp âm và chuẩn hóa volume.
* **`/effects`**: Các hiệu ứng âm thanh ngắn (SFX).

## 📊 Định Dạng Tiêu Chuẩn
* **Định dạng chính:** `.mp3` (cho nhạc nền/nén) hoặc `.wav` (cho âm thanh chất lượng cao).
* **Tần số lấy mẫu (Sample Rate):** 44.1 kHz.
* **Độ sâu bit (Bit Depth):** 16-bit.

## 🏷️ Quy Tắc Đặt Tên File
Đặt tên file theo cú pháp chữ thường, không dấu, nối nhau bằng dấu gạch ngang.
> **Cú pháp:** `[loai_am_thanh]-[ten_file]-[phien_ban].[duoi_file]`
>
> *Ví dụ:* `bgm-main-theme-v1.mp3`, `sfx-click-button.wav`

## ⚠️ Lưu Ý Khi Sử Dụng
* Không upload trực tiếp các file có dung lượng lớn hơn **50MB** lên Git (hãy sử dụng Git LFS).
* Đảm bảo tệp tin không vi phạm bản quyền trước khi lưu trữ vào thư mục này.

