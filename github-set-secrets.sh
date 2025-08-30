#!/usr/bin/env bash
set -euo pipefail

# Script to encrypt and upload repository secrets to GitHub Actions using
# the repository public key (uses PyNaCl for sealed box encryption).
# Usage:
#   export GITHUB_TOKEN="ghp_xxx..."  # PAT with repo scope
#   chmod +x github-set-secrets.sh
#   ./github-set-secrets.sh

OWNER="muhajirgood05"
REPO="portal-pajak-indonesia"

if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "Error: set GITHUB_TOKEN environment variable (Personal Access Token with 'repo' scope)." >&2
  exit 1
fi

API="https://api.github.com/repos/$OWNER/$REPO/actions/secrets/public-key"

echo "Fetching public key for $OWNER/$REPO..."
resp="$(curl -sS -H "Authorization: token $GITHUB_TOKEN" "$API")"
key_id="$(echo "$resp" | jq -r .key_id)"
pubkey="$(echo "$resp" | jq -r .key)"

if [ -z "$key_id" ] || [ -z "$pubkey" ] || [ "$key_id" = "null" ] || [ "$pubkey" = "null" ]; then
  echo "Failed to fetch public key. Response:" >&2
  echo "$resp" >&2
  exit 1
fi
echo "Public key id: $key_id"

encrypt_secret() {
  local pub="$1"
  local secret_value="$2"
  python3 - <<PY
import sys, base64
from nacl import public, encoding
pub = sys.argv[1]
secret = sys.argv[2].encode()
pk = public.PublicKey(pub.encode(), encoding.Base64Encoder())
sealed = public.SealedBox(pk).encrypt(secret)
print(base64.b64encode(sealed).decode())
PY
}

# Configure these values if needed
PRIVATE_KEY_PATH="$HOME/.ssh/portal_pajak_deploy"
DEPLOY_HOST="146.190.90.12"
DEPLOY_USER="root"
DEPLOY_PATH="/var/www/portal-pajak/html"

if [ ! -f "$PRIVATE_KEY_PATH" ]; then
  echo "Private key not found at $PRIVATE_KEY_PATH" >&2
  exit 1
fi

DEPLOY_KEY_VALUE="$(sed -n '1,$p' "$PRIVATE_KEY_PATH")"

upload_secret() {
  local name="$1"
  local value="$2"
  echo "Encrypting and uploading secret: $name ..."
  enc=$(encrypt_secret "$pubkey" "$value")
  payload=$(jq -n --arg v "$enc" --arg k "$key_id" '{encrypted_value:$v, key_id:$k}')
  url="https://api.github.com/repos/$OWNER/$REPO/actions/secrets/$name"
  resp=$(curl -sS -X PUT -H "Authorization: token $GITHUB_TOKEN" \
    -H "Content-Type: application/json" \
    -d "$payload" "$url")
  if [ -z "$resp" ]; then
    echo " -> $name uploaded"
  else
    echo " -> Response: $resp"
  fi
}

upload_secret "DEPLOY_KEY" "$DEPLOY_KEY_VALUE"
upload_secret "DEPLOY_HOST" "$DEPLOY_HOST"
upload_secret "DEPLOY_USER" "$DEPLOY_USER"
upload_secret "DEPLOY_PATH" "$DEPLOY_PATH"

echo "Done. Verify secrets in GitHub Settings -> Secrets and variables -> Actions."
