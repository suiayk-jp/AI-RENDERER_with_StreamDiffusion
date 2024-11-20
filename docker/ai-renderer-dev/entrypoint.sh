#!/bin/bash
set -e

# ComfyUIディレクトリをチェックまたはインストール
if [ ! -d "/home/ubuntu/ai-renderer/ComfyUI" ]; then
  echo "ComfyUI directory not found. Cloning repository..."
  git clone https://github.com/comfyanonymous/ComfyUI.git /home/ubuntu/ai-renderer/ComfyUI
  cd /home/ubuntu/ai-renderer/ComfyUI
  pip install -r requirements.txt
  echo -e '#!/bin/bash\npython ./main.py' > run_comfyui.sh
  chmod +x run_comfyui.sh
fi

# StreamDiffusionのセットアップ
if [ ! -d "/home/ubuntu/ai-renderer/ComfyUI-ai-renderer_with_streamdiffusion/StreamDiffusion" ]; then
  echo "StreamDiffusion directory not found. Cloning repository..."
  cd /home/ubuntu/ai-renderer/ComfyUI-ai-renderer_with_streamdiffusion
  git clone https://github.com/cumulo-autumn/StreamDiffusion.git
fi

# custom_nodesディレクトリをリンク（起動中のみ）
ln -sf /home/ubuntu/ai-renderer/ComfyUI-ai-renderer_with_streamdiffusion \
  /home/ubuntu/ai-renderer/ComfyUI/custom_nodes

exec "$@"
