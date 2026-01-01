FROM python:3.12-slim

WORKDIR /app

# 1. 安装系统工具 (编译器等)
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 2. 复制依赖定义
COPY pyproject.toml poetry.lock* /app/

# 3. 安装 Poetry
RUN pip install poetry
RUN poetry config virtualenvs.create false

# 4. 安装依赖 (🛠️ 关键修改：加上 --no-root，只装依赖，不装项目本身)
RUN poetry install --no-interaction --no-ansi --no-root

# 5. 复制所有代码 (README, 源码等都在这步进去)
COPY . /app/

# 6. 暴露端口
EXPOSE 7860

# 7. 启动命令
CMD ["poetry", "run", "python", "-m", "edit_gpt.main", "--config", "settings-ollama.yaml"]
