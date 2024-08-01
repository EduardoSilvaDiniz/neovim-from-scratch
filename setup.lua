-- fix provider python
os.execute("python3 -m pip install --user --upgrade pynvim")

os.execute("sudo dnf install -y gcc make git ripgrep fd-find unzip neovim zsh curl exa tmux")

os.execute("sudo dnf install -y node npm cargo go pip unzip wget curl gzip gtar php luarocks composer git")

os.execute("sudo sdk install java")
os.execute("sudo sdk install gradle")
os.execute("sudo sdk install kotlin")
os.execute("sudo dnf copr enable atim/lazygit -y")
os.execute("sudo dnf install lazygit")

os.execute('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
