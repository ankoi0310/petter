# ==============================================================================
# VARIABLES
# ==============================================================================
include .env
export $(shell sed 's/=.*//' .env)

# ==============================================================================
# DOCKER (DATABASE) COMMANDS
# ==============================================================================

# Khởi chạy Postgres database trên Docker
db-up:
	docker-compose up -d

# Dừng và xóa container database
db-down:
	docker stop $(DB_CONTAINER_NAME)
	docker rm $(DB_CONTAINER_NAME)

# Xem log của database (để debug kết nối)
db-logs:
	docker logs -f $(DB_CONTAINER_NAME)

# Lệnh để truy cập vào terminal của Postgres và chạy SQL
seed:
	docker exec -i $(DB_CONTAINER_NAME) psql -U $(POSTGRES_USER) -d $(POSTGRES_DB) < query/init.sql

db-test:
	docker exec -it $(DB_CONTAINER_NAME) psql -U $(POSTGRES_USER) -d $(POSTGRES_DB) -c "SELECT * FROM quotes;"

# ==============================================================================
# FLUTTER COMMANDS
# ==============================================================================

# Cài đặt thư viện và dọn dẹp
get:
	flutter pub get

clean:
	flutter clean
	flutter pub get

# Code generation (cho Freezed, JsonSerializable, Riverpod, v.v.)
gen:
	dart run build_runner build --delete-conflicting-outputs

# Watch code generation (tự động chạy lại khi bạn sửa file)
watch:
	dart run build_runner watch --delete-conflicting-outputs

# Kiểm tra lỗi code (Linting)
lint:
	flutter analyze
	flutter test

# Build ứng dụng
build-apk:
	flutter build apk --release

build-ios:
	flutter build ios --release --no-codesign

# ==============================================================================
# COMBINED COMMANDS (Lệnh tổ hợp)
# ==============================================================================

# Khởi tạo mọi thứ cho một ngày làm việc mới
init: db-up get gen
	@echo "🚀 Mọi thứ đã sẵn sàng! Chúc bạn code vui vẻ."