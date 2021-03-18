# 复制 README.md
# cp README.md docs/README.md

# sh init.sh

# 更新 master
git add .

read -p "输入备注：🎨 " message
if [ -z $message ]
then
  message="规范 "
fi

git commit -m "🎨 $message"
git push -f https://github.com/ylksty/mind.git master
git push -f https://gitee.com/joeup/mind.git master

echo "🎨 $message"