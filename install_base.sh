
sudo apt update && sudo apt upgrade -y && \
  sudo apt install neofetch zsh neovim cargo git unzip zip build-essential -y

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add alias on zshrc
echo "
alias vi='nvim'
alias vim='nvim'
" >> ~/.zshrc
