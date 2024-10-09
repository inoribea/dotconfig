cd /home/inoribea/dotconfig
echo pswd:
git remote set-url origin "https://inoribea@github.com/inoribea/dotconfig.git"
sleep 1
git add .
git commit -m update
git push origin +master
cd /home/inoribea
