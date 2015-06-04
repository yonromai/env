# Main setup script

ssh-add ~/.ssh/id_rsa

echo "Installing Homebrew..."
rm -rf /usr/local/Cellar /opt/homebrew-cask /usr/local/.git && brew cleanup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# sudo chown -R $USER /usr/local
# sudo chown -R $USER /Library/Caches/Homebrew/
# brew update

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

echo "Installing iterm2..."
brew cask install iterm2

echo "Installing Chrome..."
brew cask install google-chrome-canary

echo "Installing Spotify..."
brew cask install spotify

echo "Installing Karabiner..."
brew cask install karabiner
# `$ /Applications/Karabiner.app/Contents/Library/bin/karabiner export > ./karabiner-import.sh` to export config
sh ./karabiner-import.sh

echo "Installing Sublime..."
brew cask install sublime-text3


xcode-select --install
sudo xcodebuild -license
echo "Please go to the App Store and install XCode, then run it" 
read -n 1 -s

echo "Installing YADR..."
brew link --overwrite --dry-run vim
brew install vim
sh -c "`curl -fsSL https://raw.githubusercontent.com/skwp/dotfiles/master/install.sh`"

# Fix 'It requires Vim 7.3.885 or later with Lua support ("+lua").'
brew uninstall macvim
brew remove macvim
brew cleanup
brew install macvim --custom-icons --override-system-vim --with-lua --with-luajitq --with-cscope

echo "Setting up git..."
brew install git
git config --global user.name "Romain Yon"
git config --global user.email "yonromai@users.noreply.github.com"

# manual crap
echo "Please go to : 'System Preferences/Keyboard/Modifier Keys/Caps Lock -> Control'"
read -n 1 -s
echo "Go to 'Iterm2/Preferences/Colors/Load Presets/Solarized Dark'"
read -n 1 -s
# include http://evertpot.com/osx-tmux-vim-copy-paste-clipboard/ ?
