<p align="center"><img src="./worker.png" align="center" height="380" width="600" ></p>
<p align="center">效果图</p>

### todo
- [ ] 相关快捷键介绍
- [ ] 编写自动安装脚本

注：以CentOS7为例，其他类似
### 依赖安装
1、系统安装包升级
```shell
yum update
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```
2、yum包
```shell
yum install -y \
golang \
python36 \
nodejs \
npm \
git \
vim \
htop \
nload \
the_silver_searcher \
tldr \
wget \
net-tools \
telnet \
lsof \
unzip \
xclip \
ctags \
aria2 \
zsh \
ncurses-devel \
libevent-devel \
tig \
jq \
ShellCheck
```
3、pip包
```shell
pip3 install supervisor pynvim jedi rope
```
4、工具安装配置
* [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
* [tmux](https://github.com/tmux/tmux)
```shell
cd /usr/local/apps
wget https://github.com/tmux/tmux/releases/download/3.3/tmux-3.3.tar.gz
tar -xvzf tmux-3.0a.tar.gz
cd tmux-3.0a/
./configure && make
sudo make install
```
* [neovim](https://github.com/neovim/neovim/releases/tag/v0.4.3)
```shell
cd /usr/local/apps
wget https://github.com/antoineco/neovim-neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
tar -xvzf nvim-linux64.tar.gz
ln -s /usr/local/apps/nvim-linux64/bin/nvim /usr/local/bin/vim
```
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
```
* [yarn](https://classic.yarnpkg.com/en/docs/install#mac-stable)
```shell
npm install --global yarn
```

* [bash language server](https://github.com/bash-lsp/bash-language-server)
```
npm i -g bash-language-server
```

* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
```
git clone https://github.com/tmux-plugins/tmux-resurrect ~/clone/path
```

* [rg](https://github.com/BurntSushi/ripgrep#installation)
```
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install ripgrep
```

* [git](https://git-scm.com/book/zh/v2/%E8%B5%B7%E6%AD%A5-%E5%88%9D%E6%AC%A1%E8%BF%90%E8%A1%8C-Git-%E5%89%8D%E7%9A%84%E9%85%8D%E7%BD%AE)
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

* [ssh-keygen](https://git-scm.com/book/zh/v2/%E6%9C%8D%E5%8A%A1%E5%99%A8%E4%B8%8A%E7%9A%84-Git-%E7%94%9F%E6%88%90-SSH-%E5%85%AC%E9%92%A5)
```
ssh-keygen
```

### 配置
当前项目下执行
```shell
source init.sh
source ~/.zshrc
```

### Vim插件安装
1、国内访问git速度极慢，需要配置http代理
```shell
setproxy  # 需提前配置代理服务器
```
2、安装插件管理器[vim-plug](https://github.com/junegunn/vim-plug)
```shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
3、coc.nvim依赖安装
```
curl -sL install-node.vercel.app/lts | bash
```
4、nvim命令打开后执行`:PlugInstall`和`:GoInstallBinaries`

### Coc.nvim
* 增加拓展插件(nvim打开后执行)
```vim
:CocInstall coc-python coc-json coc-html coc-lists coc-tsserver
```

### 温馨提醒
如遇到问题，大概率是各组件或者插件版本不兼容，可尝试升级或降配版本。
