# 1. Sử dụng hình ảnh Python 3.11.0 chính thức
FROM python:3.11.0-slim

# 2. Thiết lập thư mục làm việc trong container
WORKDIR /app

# 3. Cài đặt các thư viện hệ thống cần thiết cho Qiskit và Matplotlib
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 4. Sao chép file requirements vào container
COPY requirements.txt .

# 5. Cài đặt các thư viện Python
RUN pip install --no-cache-dir -r requirements.txt

# 6. Sao chép toàn bộ các file notebook và dữ liệu vào container
COPY . .

# 7. Mở cổng 8888 để truy cập Jupyter Lab
EXPOSE 8888

# 8. Lệnh để khởi động Jupyter Lab khi container chạy
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--no-browser", "--NotebookApp.token=''"]