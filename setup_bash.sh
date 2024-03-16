#!/bin/bash

# Update system and install necessary tools
echo "Updating system and installing prerequisites..."
# If you are a root user, then you'll probably get "wtf is sudo" while executing following commands
sudo apt-get update
sudo apt-get install -y git curl zsh tmux fzf

# Install Oh My Zsh without changing the shell automatically
echo "Installing Oh My Zsh without auto-changing the shell..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh Syntax Highlighting
echo "Installing Zsh Syntax Highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Zsh Autosuggestions
echo "Installing Zsh Autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Update .zshrc file to include these plugins
echo "Updating .zshrc to include plugins..."
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf)/' ~/.zshrc

# Change default shell to Zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to Zsh..."
    chsh -s $(which zsh)
    echo "Shell changed to Zsh. Please restart your terminal or log out and back in for changes to take effect."
else
    echo "Default shell already set to Zsh."
fi

echo "Installation complete. No further action is required."
