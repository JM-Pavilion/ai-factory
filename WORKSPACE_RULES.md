# AI Workspace Rules

## 工作目录规则
所有项目只能创建在:
~/AI-Factory/projects

## 禁止操作
- 禁止删除整个项目目录
- 禁止修改系统目录
- 禁止操作用户主目录
- 禁止扫描整个磁盘

## Node规则
- 优先使用 npm
- 启动前先检查端口
- 禁止重复启动 vite
- 使用 nohup 持久化 dev server

## Git规则
- 完成任务后自动 git add .
- 自动生成 commit message
- 不提交 node_modules

## 项目规则
每个项目必须:
- 有 README
- 有 package.json
- 有 .gitignore
- 有启动脚本

## 日志规则
所有日志写入:
~/AI-Factory/logs