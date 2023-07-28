# Comands Needed
#
# 1. "build" - docker build . -t denv
# 2. "run"   - docker run \
#                 --name d.env \
#                 -itd \
#                 -v $usr/tools \
#                 -v $usr/repos
# 3. "start" - docker start d.env
# 4. "stop"  - docker stop d.env
# 5. "rebuild" - docker stop d.env && docker rm d.env && docker build . -t denv
# 
# Need to learn how to commit changes!
# 6. "save" - docker commit ?

usr="C:/users/cw109854"
command=$0

if [$command = "build"]
then
  docker build . -tag denv
  exit 0
fi



