FROM python:3.12-slim

WORKDIR /app

# 安装系统工具
RUN apt-get update && apt-get install -y git build-essential curl && rm -rf /var/lib/apt/lists/*

# 1. 优先安装依赖 (不使用 requirements.txt，直接命令行安装，让 pip 自动解决冲突)
# 关键点：langchain<0.2 保证代码不报错；gradio 没锁版本，pip 会找兼容的最新版
RUN pip install --no-cache-dir \
    "langchain<0.2.0" \
    "langchain-community<0.2.0" \
    "langchain-core<0.2.0" \
    "gradio" \
    "transformers" \
    "sentence-transformers" \
    "huggingface-hub" \
    "accelerate" \
    "duckduckgo-search" \
    "faiss-cpu" \
    "python-dotenv" \
    "pyyaml" \
    "numpy<2"

# 2. 复制你的代码 (此时你的 ui.py 应该已经被之前的脚本修好了)
COPY . .

# 3. 再次运行 pip install . 以防万一项目有特殊设置，但不安装依赖（依赖上面已经装好了）
RUN pip install --no-cache-dir --no-deps .

ENV GRADIO_SERVER_NAME="0.0.0.0"
EXPOSE 7860

CMD ["python", "-m", "edit_gpt.main", "--config", "settings-ollama.yaml"]
