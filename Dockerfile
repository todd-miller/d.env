FROM alpine:latest

RUN apk update && apk add --update \
  tzdata \
  zsh \
  zsh-vcs \
  npm \
  tmux \
  stow \
  bash \
  yarn \
  exa \
  git \
  python3 \
  cargo \
  neovim \
  ripgrep \
  zoxide \
  github-cli \
  libc6-compat \
  kbd-bkeymaps \
  alpine-sdk

RUN addgroup -S todd \
  && adduser -S todd -G todd --shell /bin/sh

ENV LV_BRANCH=release-1.3/neovim-0.9
ENV LV_PATH='https://raw.githubusercontent.com/lunarvim/lunarvim/${LV_BRANCH}/utils/installer/install.sh'
ENV HOME=/home/todd
ENV XDG_DATA_HOME=${XDG_DATA_HOME:-/home/todd/.local/share}

COPY --chown=todd:todd ./entrypoint.sh /etc
COPY --chown=todd:todd ./ssh/id_rsa.pub /home/todd/
COPY --chown=todd:todd ./shh/id_rsa /home/todd/

RUN cat '/usr/share/zoneinfo/America/New_York' > /etc/localtime
RUN su -c "bash <(curl -s ${LV_PATH})" todd 
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd
RUN sed -i 's/\r$//' etc/entrypoint.sh \
	&& chmod +x etc/entrypoint.sh

WORKDIR /home/todd
CMD /etc/entrypoint.sh
