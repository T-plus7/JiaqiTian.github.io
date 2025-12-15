# 本地开发环境配置指南

本指南将帮助你在本地配置 Jekyll 开发环境，实现实时预览网页修改。

## 方案一：使用 Ruby（推荐）

### 步骤 1：安装 Ruby

1. 访问 [RubyInstaller 官网](https://rubyinstaller.org/)
2. 下载 **Ruby+Devkit** 版本（推荐 3.1.x 或更高版本）
3. 运行安装程序，安装时**务必勾选**：
   - ✅ Add Ruby executables to your PATH
   - ✅ Associate .rb and .rbw files with this Ruby installation
4. 安装完成后，在安装程序的最后一步，选择运行 `ridk install`，然后选择选项 3（安装 MSYS2 和 MINGW 开发工具链）

### 步骤 2：验证安装

打开 PowerShell，运行：

```powershell
ruby --version
gem --version
```

如果显示版本号，说明安装成功。

### 步骤 3：配置项目

在项目根目录运行配置脚本：

```powershell
.\setup.ps1
```

这个脚本会：
- 检查 Ruby 和 Bundler
- 配置 bundle 使用本地路径（避免权限问题）
- 安装所有 Jekyll 依赖

### 步骤 4：启动本地服务器

运行启动脚本：

```powershell
.\start.ps1
```

或者直接运行：

```powershell
bundle exec jekyll serve -l -H localhost
```

### 步骤 5：查看网站

在浏览器中访问：**http://localhost:4000**

### 实时预览功能

- ✅ 修改 `.md` 文件后，页面会自动刷新
- ✅ 修改 HTML 文件后，页面会自动刷新
- ⚠️ 修改 `_config.yml` 后，需要**重启服务器**（按 Ctrl+C 停止，然后重新运行 `start.ps1`）

---

## 方案二：使用 Docker（如果已安装 Docker）

如果你已经安装了 Docker Desktop，可以使用以下命令：

```powershell
docker compose up
```

然后在浏览器访问：**http://localhost:4000**

---

## 常见问题

### 1. 权限错误

如果遇到权限错误，确保运行了 `setup.ps1`，它会配置 bundle 使用本地路径。

### 2. 端口被占用

如果 4000 端口被占用，可以指定其他端口：

```powershell
bundle exec jekyll serve -l -H localhost -P 4001
```

### 3. 依赖安装失败

如果 `bundle install` 失败：
1. 确保已安装 Ruby+Devkit（不是普通 Ruby）
2. 确保在安装时运行了 `ridk install`
3. 尝试删除 `Gemfile.lock` 后重新运行 `bundle install`

### 4. 修改不生效

- Markdown 文件修改：自动刷新
- `_config.yml` 修改：需要重启服务器
- CSS/JS 文件修改：可能需要清除浏览器缓存

---

## 快速命令参考

```powershell
# 首次配置
.\setup.ps1

# 启动服务器
.\start.ps1

# 或者手动启动
bundle exec jekyll serve -l -H localhost

# 停止服务器
按 Ctrl+C
```

---

## 下一步

配置完成后，你可以：
1. 修改 `_config.yml` 配置个人信息
2. 修改 `_pages/about.md` 更新首页内容
3. 在浏览器中实时查看修改效果

