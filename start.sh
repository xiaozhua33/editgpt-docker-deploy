#!/bin/bash

# 1. 检查配置文件
if [ ! -f settings-ollama.yaml ]; then
    echo "⚠️  未找到配置文件，正在从示例生成..."
    if [ -f settings-ollama.example.yaml ]; then
        cp settings-ollama.example.yaml settings-ollama.yaml
    else
        touch settings-ollama.yaml
    fi
fi

# 2. 智能检查：如果镜像不存在，才构建
if [[ "$(docker images -q editgpt-final 2> /dev/null)" == "" ]]; then
    echo "🏗️  首次运行，正在构建镜像..."
    docker build -t editgpt-final .
else
    echo "✅ 镜像已就绪，跳过构建..."
fi

# 3. 启动容器
echo "🚀 正在启动 editGPT..."
docker run -it --rm -p 7860:7860 \
  -e GRADIO_SERVER_NAME=0.0.0.0 \
  -v $(pwd)/settings-ollama.yaml:/app/settings-ollama.yaml \
  --add-host=host.docker.internal:host-gateway \
  editgpt-final \
  python -m edit_gpt.main --config settings-ollama.yaml
