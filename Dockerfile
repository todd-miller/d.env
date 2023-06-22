FROM alpine:latest

# ARG INSTALL_PATH="https://raw.githubusercontent.com/lunarvim/lunarvim/release-1.3/neovim-0.9/utils/installer/install.sh"
# RUN apk update \
#   && apk add curl \
#   && apk add \
#   zsh \
#   yarn \
#   git \
#   python3 \
#   cargo \
#   neovim \
#   ripgrep \
#   alpine-sdk \
#   bash --update \
#   && LV_BRANCH='release-1.3/neovim-0.9" \
#   su -c "bash <(curl -s ${INSTALL_PATH})" lunaruser && su -c /home/lunaruser/.local/bin/lvim lunaruser'


RUN apk update && apk add --update \
  zsh \
  stow \
  bash \
  yarn \
  git \
  python3 \
  cargo \
  neovim \
  ripgrep \
  alpine-sdk

RUN addgroup -S todd && adduser -S todd -G todd --shell /bin/sh

ENV LV_BRANCH=release-1.3/neovim-0.9
ENV LV_PATH='https://raw.githubusercontent.com/lunarvim/lunarvim/${LV_BRANCH}/utils/installer/install.sh'
ENV HOME=/home/todd
ENV XDG_DATA_HOME=${XDG_DATA_HOME:-/home/todd/.local/share}

RUN su -c "bash <(curl -s ${LV_PATH})" todd 
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd
RUN export PATH="$PATH:/home/todd/.local/bin"
RUN export HOME=/home/todd

# Set the entrypoint to the `ASH` shell
WORKDIR /home
# CMD su -c /home/lunaruser/.local/bin/lvim lunaruser
ENTRYPOINT ["/bin/zsh"]
