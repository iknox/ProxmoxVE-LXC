#!/usr/bin/env bash

# Author: Ian Knox(iknox)
# License: MIT
# Source:

source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Base Dependencies"
$STD apt-get install -y curl wget ca-certificates
msg_ok "Installed Base Dependencies"

msg_info "Installing UV"
$STD wget -qO- https://astral.sh/uv/install.sh | sh
msg_ok "Installed UV"

msg_info "Installing FlashInfer & SGLang"
$STD mkdir /opt/sglang && cd /opt/sglang
$STD uv pip install flashinfer-python flashinfer-cubin
$STD uv pip install "sglang" --prerelease=allow
msg_ok "Installed FlashInfer & SGLang"

# msg_info "Downloading and executing tools.func test suite"
# bash <(curl -fsSL https://git.community-scripts.org/community-scripts/ProxmoxVED/raw/branch/main/misc/test-tools-func.sh)
# msg_ok "Test suite completed"

motd_ssh
customize
cleanup_lxc
