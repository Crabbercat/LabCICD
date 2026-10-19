CC = gcc
CFLAGS = -Wall -Wextra -O3

# 1. Giai đoạn Biên dịch (Build)
build:
	$(CC) $(CFLAGS) prime_utils.c test_app.c -o validator

# 2. Giai đoạn Kiểm thử (Test)
test: build
	./validator

# 3. Giai đoạn Quét mã tĩnh (Lint) - Bỏ qua các thông báo thông tin thư viện chuẩn
lint:
	cppcheck --enable=all --suppress=missingIncludeSystem --suppress=checkersReport --error-exitcode=1 prime_utils.c test_app.c

# 4. Dọn dẹp hệ thống
clean:
	rm -f validator *.tar.gz