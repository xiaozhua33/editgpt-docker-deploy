import re
import os

file_path = "edit_gpt/ui/ui.py"

if os.path.exists(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    
    # 使用正则表达式删除 height=数字 的参数 (Gradio 5.0 不再支持此参数)
    new_content = re.sub(r'height=\d+,?\s*', '', content)
    
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(new_content)
    print("✅ 代码修复完成：已移除过时的 height 参数")
else:
    print("❌ 找不到文件，请确认你在 editgpt-docker-deploy 目录下")
