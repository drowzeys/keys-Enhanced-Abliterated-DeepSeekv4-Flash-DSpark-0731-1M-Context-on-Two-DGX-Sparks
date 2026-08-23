# Agent one-shot — DSV4F 0731 ablit 1M on two DGX Sparks (1.0 Beta)

**Repo:** https://github.com/drowzeys/keys-Enhanced-Abliterated-DeepSeekv4-Flash-DSpark-0731-1M-Context-on-Two-DGX-Sparks

1. Clone this repo. Read `RESPONSIBLE_USE.md` if present, else treat as uncensored research weights.
2. Pull `ghcr.io/anemll/dspark-vllm-gx10:0.1.1` (or the Keys GHCR mirror `:1.0-beta`).
3. Place L10–35 anchorstock ablit weights (HF gated Keys 0731 pack or lab path `dsv4f-0731-ablit-l10-35-anchorstock`).
4. `GPU_MEMORY_UTILIZATION=0.835`. `MAX_MODEL_LEN=1048576`. **Never** raise util above **0.85**.
5. Leave NCCL GID unset (pinning hangs `ibv_modify_qp 61` on this fabric).
6. Start DS4 **first** if MiniMax-H3 will co-tenant. One heavy H3 job per Spark.
7. Smoke: `curl http://HEAD:8888/v1/models` then a 17*19=323 thinking-off completion.

Stock Mia 0731 docs: `previous-version/`.
