# CCSetup

<div align="center">

<img src="logo.svg" alt="CCSetup Logo" width="128" height="128">

**The elegant way to setup your Claude Code environment**

[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blue.svg)](https://claude.ai/code)
[![MCP](https://img.shields.io/badge/MCP-Enabled-green.svg)](https://modelcontextprotocol.io/)
[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://python.org)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](#license)
[![Fork](https://img.shields.io/badge/Fork%20of-AizenvoltPrime/claude--setup-lightgrey.svg)](https://github.com/AizenvoltPrime/claude-setup)
[![GitHub stars](https://img.shields.io/github/stars/HamGuy/claude-setup?style=social)](https://github.com/HamGuy/claude-setup)

**Language**: [English](#english) | [中文](#中文)

</div>

---

## English

> A personalized fork based on [AizenvoltPrime/claude-setup](https://github.com/AizenvoltPrime/claude-setup) with custom enhancements and optimizations.

### Features

- **MCP Servers**: Context7, Puppeteer, Sequential Thinking, DeepWiki
- **Custom Commands**: Intelligent workflows for commits, tasks, and problem-solving
- **Hook System**: Automated directory management and workflow triggers
- **Structured Workflows**: Organized task management and planning

### Quick Start

```bash
# One-click installation
curl -fsSL https://raw.githubusercontent.com/HamGuy/claude-setup/main/install.sh | bash

# Initialize project
ccsetup init

# Start using
/task_medium implement user authentication
```

### Main Commands

#### Setup Configuration
```bash
ccsetup init          # Current directory
ccsetup init --global # Global configuration
```

#### Common Commands
```bash
/task_medium [problem description]  # Complex task processing
/code-review                        # Code review
/commit                            # Intelligent commit
/task_easy                         # Simple tasks
```

### Troubleshooting

- Hook not triggering: Check `uv` installation and permissions
- Directory creation fails: Check file system permissions
- MCP servers not loading: Check Node.js and configuration

### 💖 Support the Project

If CCSetup has been helpful to you, consider supporting the development of this open-source project! Your support helps us:
- 🛠 Continue improving and fixing bugs
- ✨ Develop more useful features  
- 📚 Improve documentation and user guides
- 🔧 Maintain and update MCP server integrations

#### Donation Options

<div align="center">

**☕ Buy Me a Coffee**

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Support%20Development-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://coff.ee/wangrui15f)

**💰 Chinese Payment Methods**

<table>
<tr>
<td>
<img src="https://cdn.hamguy.xyz/IMG_8236.PNG" width="200" alt="Alipay QR Code"><br>
<b>Alipay</b>
</td>
<td>
<img src="https://cdn.hamguy.xyz/IMG_8238.JPG" width="200" alt="WeChat Pay QR Code"><br>
<b>WeChat Pay</b>
</td>
</tr>
</table>

</div>

---

## 中文

> 基于 [AizenvoltPrime/claude-setup](https://github.com/AizenvoltPrime/claude-setup) 的个人定制版本，包含自定义增强功能和优化。

### 功能特性

- **MCP 服务器**: Context7, Puppeteer, Sequential Thinking, DeepWiki
- **自定义命令**: 智能工作流，包括提交、任务处理和问题解决
- **钩子系统**: 自动化目录管理和工作流触发
- **结构化工作流**: 有组织的任务管理和规划

### 快速开始

```bash
# 一键安装
curl -fsSL https://raw.githubusercontent.com/HamGuy/claude-setup/main/install.sh | bash

# 初始化项目
ccsetup init

# 开始使用
/task_medium implement user authentication
```

### 主要命令

#### 初始化配置
```bash
ccsetup init          # 当前目录
ccsetup init --global # 全局配置
```

#### 常用命令
```bash
/task_medium [problem description]  # 复杂任务处理
/code-review                        # 代码审查
/commit                            # 智能提交
/task_easy                         # 简单任务
```

### 故障排除

- Hook 不触发：检查 `uv` 安装和权限
- 目录创建失败：检查文件系统权限
- MCP 服务器未加载：检查 Node.js 和配置

### 💖 支持项目

如果 CCSetup 对您有帮助，欢迎支持开源项目的发展！您的支持将帮助我们：
- 🛠 持续改进和修复 bug
- ✨ 开发更多实用功能
- 📚 完善文档和用户指南
- 🔧 维护和更新 MCP 服务器集成

#### 捐赠方式

<div align="center">

**☕ Buy Me a Coffee**

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-支持开发-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://coff.ee/wangrui15f)

**💰 国内支付**

<table>
<tr>
<td>
<img src="https://cdn.hamguy.xyz/IMG_8236.PNG" width="200" alt="支付宝收款码"><br>
<b>支付宝</b>
</td>
<td>
<img src="https://cdn.hamguy.xyz/IMG_8238.JPG" width="200" alt="微信收款码"><br>
<b>微信支付</b>
</td>
</tr>
</table>

</div>

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
