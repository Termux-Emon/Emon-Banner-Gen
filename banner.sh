#!/data/data/com.termux/files/usr/bin/bash

# Color Codes
GRN="\033[1;32m"
CYN="\033[1;36m"
NC="\033[0m"

# Check & install requirements
for pkg in figlet lolcat neofetch; do
  if ! command -v $pkg &> /dev/null; then
    echo -e "${CYN}📦 Installing $pkg...${NC}"
    pkg install $pkg -y > /dev/null 2>&1
  fi
done

# Prompt
clear
echo -e "${CYN}🛠️  EMon Hacker Banner Generator${NC}"
read -p "🔤 Enter your banner text: " text

# Save banner script
cat > ~/.banner <<EOF
clear
echo -e "\033[1;32m"
figlet -w 80 "$text" | lolcat
echo -e "\033[0m"
neofetch
echo -e "\033[1;36m[✔] System ready, Commander $text\033[0m"
EOF

# Add to .bashrc if not present
if ! grep -q "~/.banner" ~/.bashrc; then
  echo -e "\n# Load EMon banner\nbash ~/.banner" >> ~/.bashrc
fi

# Preview
echo -e "${GRN}\n✅ Banner Installed! Restart Termux to see it.${NC}"
sleep 1
bash ~/.banner
