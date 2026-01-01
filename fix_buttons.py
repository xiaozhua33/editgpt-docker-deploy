import os

file_path = "edit_gpt/ui/ui.py"
if os.path.exists(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    
    new_lines = []
    for line in lines:
        # 只要这一行代码里尝试访问 .undo_btn 或 .retry_btn，我们就把它注释掉
        # 这是因为 Gradio 5.0 移除了这些属性，直接删除调用即可防止崩溃
        if ".undo_btn.click" in line or ".retry_btn.click" in line or ".clear_btn.click" in line:
            # 保留缩进，但在前面加上 # 注释
            new_lines.append(f"            # {line.lstrip()}") 
        else:
            new_lines.append(line)
            
    with open(file_path, "w", encoding="utf-8") as f:
        f.writelines(new_lines)
    print("✅ 代码修复完成：已屏蔽不兼容的按钮监听器")
else:
    print("❌ 找不到文件 edit_gpt/ui/ui.py")
