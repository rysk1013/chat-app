# エラーが発生するとスクリプトを終了する
#!/bin/bash
set -e

# railsのpidが存在している場合に削除する
# Remove a potentially pre-existing server.pid for Rails.
rm -f /chat-app/tmp/pids/server.pid

# DockerfileのCMDで渡されたコマンドを実行
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"