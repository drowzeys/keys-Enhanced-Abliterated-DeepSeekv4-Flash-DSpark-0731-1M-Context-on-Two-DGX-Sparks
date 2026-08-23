# Credits

**Big thanks.** Two-Spark DSV4F 0731 at 1M exists because of the projects below.
Star and cite them first. Mia stock 0731 credits: [`previous-version/CREDITS.md`](previous-version/CREDITS.md).

## Runtime and dual-node packaging

- **[Anemll / dspark-vllm-gx10](https://github.com/Anemll/dspark-vllm-gx10)** —
  `ghcr.io/anemll/dspark-vllm-gx10:0.1.1`, vLLM 0.25.2.dev0, DSpark, NVFP4 DS-MLA on GB10.
  The live champion image.
- **[MiaAI-Lab / DeepSeek-v4-Flash-DSpark-2x-DGX-Spark](https://github.com/MiaAI-Lab/DeepSeek-v4-Flash-DSpark-2x-DGX-Spark)** —
  TP=2 Compose, fabric env, start/stop, 1M profile. This repo is a Keys 1.0 Beta layer on that fork.
- **[Tony / tonyd2wild](https://github.com/tonyd2wild)** —
  [ds4-h3-video-gen-factory](https://github.com/tonyd2wild/ds4-h3-video-gen-factory) dual-serve
  (DS4 first, util discipline, `--disable-pinned-memory`) and
  [0731 1M NVFP4-KV 2× Spark](https://github.com/tonyd2wild/DeepSeek-v4-Flash-0731-DSpark-1M-NVFP4-KV-2x-DGX-Spark).

## DSpark / vLLM

- **[Fraser Price](https://huggingface.co/fraserprice/DeepSeek-V4-Flash-DSpark)** / [dspark-vllm](https://github.com/fraserprice/dspark-vllm)
- **[Rafael Caricio](https://github.com/rafaelcaricio/vllm/pull/1)** — DSpark vLLM integration PRs
- **[vLLM](https://github.com/vllm-project/vllm)** · **[FlashInfer](https://github.com/flashinfer-ai/flashinfer)**
- **NVIDIA** — GB10 / CUDA / NCCL
- **eugr / spark-vllm-b12x** — fp8 KV + B12X side-lane we A/B'd (same L10–35 weights; champion stayed slightly ahead)

## Model

- **[DeepSeek-AI](https://www.deepseek.com/)** — V4-Flash 0731 and DSpark / DeepSpec
- Ablit HF pack lineage: Keys L10–35 anchorstock (this 1.0 Beta) · L10–42 mida in older notes

## What this 1.0 Beta adds

Champion knobs: util **0.835**, GID **unset**, `nvfp4_ds_mla`, 1M ctx, L10–35 `wo_b` ablit,
2026-08-23 real-serve benches (C1 list **82.7**, C6 list **~309**). Do not raise util above **0.85**.
