# 霍格沃茨图书馆 · 在线只读浏览站

把本地书库发布成网页，手机/电脑浏览器随时只读浏览（封面墙 + 表格 + 搜索 + 详情）。

## 目录结构

```
library-web/
├── index.html          # 单页前端（封面墙/表格/搜索/详情弹层，纯静态）
├── data/
│   ├── library.json    # 净化版书库数据（不含本机文件路径）
│   └── covers/         # 封面图片
├── publish.bat         # 一键发布脚本
└── README.md
```

## 首次部署（只做一次）

1. 在 GitHub 网页新建**公开仓库** `library-web`（不要勾选任何初始化文件）。
2. 本目录执行（或手动操作）：
   ```bash
   git init
   git add -A
   git commit -m "init"
   git branch -M main
   git remote add origin https://github.com/heroufo/library-web.git
   git push -u origin main
   ```
   首次 push 会弹出 GitHub 登录窗口，浏览器授权一次即可。
3. 打开 GitHub 仓库页面 → Settings → Pages → Source 选 `main` 分支 / root → Save。
4. 等待 1-2 分钟，访问：`https://heroufo.github.io/library-web/`

## 日常更新书库

本地程序里增删改书籍后，双击 `publish.bat` 即可（自动导出最新数据 → 推送 → Pages 自动上线）。

## 常见问题

- **改到另一台电脑**：复制本文件夹到新电脑，把 `publish.bat` 顶部的 `EXPORT_SCRIPT` 和 `PYTHON` 路径改成新电脑的即可。
- **不想带封面**：删除 `data/covers/` 下图片，页面自动显示占位封面（`index.html` 无封面时用 📕）。
- **数据隐私**：导出的 `library.json` 不含 `file_path`（本机路径）与书库无关字段；`notes`/`blurb` 会随书发布，介意可在导出脚本 `EXPORT_FIELDS` 中删除。
