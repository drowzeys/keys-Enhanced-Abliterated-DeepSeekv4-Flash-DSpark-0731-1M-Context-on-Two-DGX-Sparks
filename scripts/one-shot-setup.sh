#!/usr/bin/env bash
# 1.0 Beta: Anemll image + 1M / util 0.835 champion defaults.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE="${DSPARK_VLLM_IMAGE:-ghcr.io/anemll/dspark-vllm-gx10:0.1.1}"
MIRROR="${DSPARK_VLLM_MIRROR:-ghcr.io/drowzeys/keys-dsv4f-0731-ablit-1m-two-spark:1.0-beta}"
echo "== keys DSV4F 0731 ablit 1M two-Spark (1.0 Beta) =="
echo "Credits: Anemll image + MiaAI-Lab 2x recipe. Keys ablit + champion knobs."
echo
if command -v docker >/dev/null; then
  echo "[1/3] docker pull $IMAGE"
  docker pull "$IMAGE" || docker pull "$MIRROR" || echo "pull failed — load the image on both Sparks"
else
  echo "[1/3] docker not on PATH"
fi
echo "[2/3] util 0.835 · max_model_len 1048576 · GID unset · TP=2"
echo "[3/3] edit fabric IPs, then ./start-deepseek-v4-flash-dspark.sh"
echo "Agent contract: $ROOT/AGENTS.md"
echo "Archived Mia stock recipe: $ROOT/previous-version/"
