PACKAGER='zypper'
LIST_PACKAGES='zsh neovim cargo rust python3 openjdk go git openssl-devel'
META_PACKAGES='devel_basis devel_java devel_C_C++'

sudo $PACKAGER install $LIST_PACKAGES -y
sudo $PACKAGER install -t pattern $META_PACKAGES -y

git clone https://github.com/EduardoSilvaDiniz/neovim-vanilla.git ~/.config/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/sta
rt/packer.nvim

# installs NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# download and install Node.js
nvm install 20
# verifies the right Node.js version is in the environment
node -v # should print `v20.12.0`
# verifies the right NPM version is in the environment
npm -v # should print `10.5.0`

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "
alias vi='nvim'
alias vim='nvim'
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
" >> .zshrc

echo "Abra nvim e execute PackerSync para instalar os plugins"
