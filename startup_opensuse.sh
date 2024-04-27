PACKAGER='zypper'

sudo $PACKAGER install zsh neovim cargo go git openssl-devel -y
sudo $PACKAGER install -t pattern devel_basis devel_java devel_C_C++ devel_python3 -y

# clone my repository nvim configs
git clone https://github.com/EduardoSilvaDiniz/neovim-vanilla.git ~/.config/nvim
# changing the folder name to avoid errors when running neovim
mv ~/.config/nvim/after ~/.config/nvim/CHANGEafter

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add alias on zshrc
echo "
alias vi='nvim'
alias vim='nvim'
" >> .zshrc

echo 'open nvim and execute command PackerSync for install plugins and change name folder CHANGEafter for after on .config/nvim'
