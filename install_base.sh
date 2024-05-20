
sudo apt update && sudo apt upgrade -y && \
  sudo apt install neofetch zsh neovim cargo git unzip zip build-essential -y

# clone my repository nvim configs
git clone https://github.com/EduardoSilvaDiniz/neovim-vanilla.git ~/.config/nvim

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add alias on zshrc
echo "
alias vi='nvim'
alias vim='nvim'
" >> ~/.zshrc
