#!/usr/bin/env bash
# Register the project's plugin marketplaces and install its plugins.
# Idempotent: already-registered marketplaces and installed plugins are skipped.

set -u

add_marketplace() {
  claude plugin marketplace list 2>/dev/null | grep -q "$2" || claude plugin marketplace add "$1" >/dev/null 2>&1
}

install_plugin() {
  claude plugin list 2>/dev/null | grep -q "$1" || claude plugin install "$1" >/dev/null 2>&1
}

add_marketplace heygen-com/hyperframes hyperframes
add_marketplace lemomo-ai/lemo-opuscar lemolab
add_marketplace anthropics/skills anthropic-agent-skills

install_plugin hyperframes@hyperframes
install_plugin lemo-opuscar@lemolab

exit 0
