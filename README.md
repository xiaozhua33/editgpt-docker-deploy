🤖 EditGPT: 你的本地代码辅助专家 (Docker 版)
EditGPT 不仅仅是一个聊天机器人，它是一个能够直接感知并修改你本地代码的 AI 智能体。通过集成 Ollama，它实现了 100% 的本地化推理，确保你的代码隐私永远留在本地。

✨ 为什么选择 EditGPT？
🔒 隐私至上：支持完全本地运行（Llama 3.1），核心代码无需上传云端。

🛠️ 真正的“手术刀”：AI 不只给出建议，还能通过 Agent 直接修改你的文件。

👀 差异化预览 (Diff View)：内置代码对比功能，AI 改了哪里一目了然，支持一键采纳。

🌐 知识增强：内置 RAG（检索增强生成）和 Web 搜索，让 AI 理解你的整个项目结构。

🚀 快速启动 (Docker 部署)
只需三步，即可在本地开启你的 AI 编程助手：

1. 克隆项目并进入目录
Bash

git clone https://github.com/xiaozhua33/editgpt-docker-deploy.git
cd editgpt-docker-deploy
2. 配置本地 Ollama 连接
编辑项目中的 settings.yaml 文件，将 base_url 改为你宿主机的局域网 IP（例如你的测试 IP）：

YAML

# settings.yaml 示例
llm:
  provider: ollama
  base_url: "http://10.19.162.99:11434" # 替换为你电脑的真实 IP
  model: llama3.1
3. 使用 Docker 一键运行
Bash

docker build -t editgpt-app .
docker run -p 7860:7860 editgpt-app
完成后，在浏览器访问：http://localhost:7860 即可开始体验！

🛠️ 核心架构
项目基于 LangChain 与 Gradio 5.0 构建，采用模块化设计：

智能体层 (Agent)：负责理解复杂指令并调用文件编辑工具。

存储层 (DiffStorage)：精确记录每一次代码变动，生成标准的 Diff 格式。

界面层 (UI)：适配最新 Gradio 5.0 架构，提供流畅的侧边栏与对话体验。

📅 未来计划 (TODO)
[ ] 恢复 Gradio 5.0 移除的撤销/重试快捷按钮。

[ ] 增加更多本地向量数据库支持，提升 RAG 检索精度。

🤝 贡献与反馈
如果你在使用过程中遇到任何问题，欢迎提交 Issue 或 Pull Request。
