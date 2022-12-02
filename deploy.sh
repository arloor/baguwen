#! /bin/bash

hosts="ti.arloor.com"
msg="commit $USER $(date)"

git pull && git add . && git commit -m "$msg" && git push || {
  echo -e "\033[32m 推送失败 \033[0m"
}

for host in $hosts; do
  ssh root@${host} -t "
            # wget "https://www.arloor.com/tarloor.sh" -O /usr/local/bin/tarloor
            bash tarloor 1 #使用代理: bash tarloor 1
            "
  echo -e "\033[32m 请访问： https://"${host}"\033[0m"
done
