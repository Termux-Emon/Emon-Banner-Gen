#!/data/data/com.termux/files/usr/bin/bash

# Colors
RED="\033[1;31m"
GRN="\033[1;32m"
CYN="\033[1;36m"
YEL="\033[1;33m"
NC="\033[0m"

# Ask for banner text
clear
echo -e "${CYN}🛠️  EMon Banner Generator${NC}"
echo -n -e "${YEL}🔤 Enter your banner text: ${NC}"
read text

echo -n -e "${YEL}🎨 Choose color [red/green/cyan/yellow]: ${NC}"
read color

# Set color
case $color in
  red) COLOR=$RED ;;
  green) COLOR=$GRN ;;
  cyan) COLOR=$CYN ;;
  yellow) COLOR=$YEL ;;
  *) COLOR=$GRN ;;
esac

# Save banner to ~/.banner
echo -e "clear\nfiglet \"$text\" | lolcat\nneofetch" > ~/.banner

# Add autoload to ~/.bashrc if not already there
if ! grep -q ".banner" ~/.bashrc; then
  echo -e "\n# Load EMon Banner\nbash ~/.banner" >> ~/.bashrc
fi

# Show preview
echo -e "${GRN}\n✅ Banner installed! Restart Termux to see it.${NC}"
sleep 1
bash ~/.banner
