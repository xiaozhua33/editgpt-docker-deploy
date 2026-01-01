import re
import os

file_path = "edit_gpt/ui/ui.py"

if os.path.exists(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    
    # 1. 删除 height 参数 (之前的修复)
    content = re.sub(r'height=\d+,?\s*', '', content)
    
    # 2. 删除 show_copy_button 参数 (这次的新修复)
    # 匹配 show_copy_button=True 或 False，以及后面的逗号和空格
    content = re.sub(r'show_copy_button=(True|False),?\s*', '', content)
    
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("✅ 代码修复完成：已移除 height 和 show_copy_button 参数")
else:
    print("❌ 找不到文件，请确认你在 editgpt-docker-deploy 目录下")
