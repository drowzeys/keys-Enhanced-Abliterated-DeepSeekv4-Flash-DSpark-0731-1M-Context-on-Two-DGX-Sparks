# keys-Enhanced-Abliterated-DeepSeekv4-Flash-DSpark-0731-1M-Context-on-Two-DGX-Sparks

**1.0 Beta** · Two DGX Sparks (GB10) · DeepSeek-V4-Flash **0731** · DSpark · **1M context** · L10–35 anchorstock ablit · Anemll vLLM 0.25.2

MiaAI-Lab / stock 0731 recipe and older benches: [`previous-version/`](previous-version/README.md)

These weights have safety refusals removed. Research / red-team only — you supply the guardrails.

## Big thanks

This recipe stands on other people's work. Please star them.

- **[Anemll](https://github.com/Anemll/dspark-vllm-gx10)** — GB10 vLLM + DSpark image  
- **[MiaAI-Lab](https://github.com/MiaAI-Lab/DeepSeek-v4-Flash-DSpark-2x-DGX-Spark)** — two-node Spark packaging  
- **[Tony / tonyd2wild](https://github.com/tonyd2wild/ds4-h3-video-gen-factory)** — dual-serve factory + 1M NVFP4 recipe  
- **[Fraser Price](https://huggingface.co/fraserprice/DeepSeek-V4-Flash-DSpark)** · **[Rafael Caricio](https://github.com/rafaelcaricio/vllm/pull/1)** — DSpark in vLLM  
- **DeepSeek-AI** — V4-Flash 0731  

Full list: **[CREDITS.md](CREDITS.md)**. Please donate / support: **[GoFundMe](https://t.co/5O4WUxexXa)**.

## Headline (measured 2026-08-23, live champion TP=2 `.1`+`.5`)

Real-serve, thinking **off**, decode = post-TTFT. Anemll `nvfp4_ds_mla`, GID **unset**, util **0.835**, max_model_len **1,048,576**.

| | Champion 2× GB10 |
|---|---:|
| C1 list | **82.7 tok/s** |
| C1 count | **~85 tok/s** |
| C6 list aggregate | **~309 tok/s** |
| Context | **1,048,576** |
| GPU util | **0.835** (hard cap **0.85**) |

Same-weight eugr B12X+fp8 KV side-lane (786k ctx): C1 list **79.6**, C6 list **~298**. About the same class; champion stays slightly ahead. Do not raise util above 0.85.

Raw JSON: [`results/1.0-beta/`](results/1.0-beta/).

## One-shot (agent)

```text
Clone https://github.com/drowzeys/keys-Enhanced-Abliterated-DeepSeekv4-Flash-DSpark-0731-1M-Context-on-Two-DGX-Sparks
Read AGENTS.md and RESPONSIBLE_USE.md first.
Stand up DSV4F 0731 L10–35 ablit TP=2 on two DGX Sparks using the Anemll image.
GPU_MEMORY_UTILIZATION=0.835. MAX_MODEL_LEN=1048576. Never exceed util 0.85.
Leave NCCL GID unset. DS4 first if co-tenanting H3.
```

Human:

```bash
git clone https://github.com/drowzeys/keys-Enhanced-Abliterated-DeepSeekv4-Flash-DSpark-0731-1M-Context-on-Two-DGX-Sparks.git
cd keys-Enhanced-Abliterated-DeepSeekv4-Flash-DSpark-0731-1M-Context-on-Two-DGX-Sparks
bash scripts/one-shot-setup.sh
# edit MASTER_ADDR / worker IP / NCCL NICs, then:
./start-deepseek-v4-flash-dspark.sh
```

## Stack

| Piece | Value |
|---|---|
| Image | `ghcr.io/anemll/dspark-vllm-gx10:0.1.1` (also mirrored `ghcr.io/drowzeys/keys-dsv4f-0731-ablit-1m-two-spark:1.0-beta`) |
| Recipe carrier | `ghcr.io/drowzeys/keys-dsv4f-0731-ablit-1m-two-spark-recipe:1.0-beta` |
| Topology | TP=2, two GB10, RoCEv2 |
| KV | `nvfp4_ds_mla` |
| Ablit | L10–35 `wo_b` λ3.5 anchorstock (DSpark 36–42 stock). L10–42 mida is the fuller ablit, not this speed champion. |
| API | `:8888` · id `deepseek-v4-flash-0731` |

## Credits

Thanks to everyone who contributed — full credits in **[CREDITS.md](CREDITS.md)**. Keys layer: L10–35 ablit + champion knobs.
