# AI-RENDERER with StreamDiffusion

## 概要
このプロジェクトは、StreamDiffusion を使用した AI レンダラーを構築する開発環境を提供します。また、ComfyUI を統合し、AI ノードを通じて生成されたレンダリング結果を操作可能にします。

## プロジェクト構成
```bash
AI-RENDERER_with_StreamDiffusion/
├── docker/                          # Dockerファイルと実行環境の設定
│   ├── ai-renderer-dev/             # 開発用Dockerfileとエントリポイントスクリプト
│   ├── server-runtime/              # サーバ用実行環境（ひな形）
│   └── client-runtime/              # クライアント用実行環境（ひな形）
├── ComfyUI-ai-renderer_with_streamdiffusion/  # ComfyUI統合とStreamDiffusion設定
│   ├── nodes.py                     # カスタムノード定義
│   └── StreamDiffusion/             # StreamDiffusion関連ファイル
└── docker-compose.yml               # 環境全体を管理する設定ファイル
```

## 必要要件
以下のツールがインストールされていることを確認してください：
- Docker
- Docker Compose
- NVIDIAドライバ (CUDA 11.8 対応)

## 初期設定
### 1. ComfyUIのローカルディレクトリを設定
ローカル環境に既存のComfyUIがある場合、環境変数COMFYUI_DIRを設定します。
```bash
export COMFYUI_DIR=/path/to/your/local/ComfyUI
```

### 2. ComfyUIがインストールされていない場合
ComfyUIがローカルにインストールされていない場合、以下の手順でインストールします。
```bash
cd ~
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt
```
次に、ComfyUIの実行用スクリプトを作成します。
```bash
echo -e "#!/bin/bash\npython ./main.py" > run_comfyui.sh
chmod +x run_comfyui.sh
```
このスクリプトは、コンテナ内でComfyUIを起動する際に使用します。

## 環境構築と起動

### 1. コンテナのビルド
以下のコマンドを実行して、Dockerコンテナをビルドします。
```bash
docker-compose build
```

## 2. コンテナの起動
コンテナを起動するためには、以下のコマンドを実行します。
```bash
docker-compose up
```
これで、開発環境が起動します。ComfyUIがインストールされていない場合は、自動的にインストールされるか、手動でセットアップされたComfyUIが利用されます。

## 3. コンテナにアクセスする
コンテナにアクセスするには、以下のコマンドを実行します。
```bash
docker exec -it ai-renderer-dev /bin/bash
```
コンテナ内でcdを使用して、作業ディレクトリに移動できます。
```bash
cd /home/ubuntu/ai-renderer
```

## 4. StreamDiffusionのクローンとカスタムノードの配置
コンテナ起動時に、StreamDiffusionのリポジトリをクローンして、ComfyUIのカスタムノードディレクトリにコピーします。この操作はコンテナ内でのみ有効です。
```bash
cd /home/ubuntu/ai-renderer_with_StreamDiffusion/ComfyUI-ai-renderer_with_streamdiffusion/
git clone https://github.com/cumulo-autumn/StreamDiffusion.git
cp -r StreamDiffusion/ /path/to/ComfyUI/custom_nodes/
```
これにより、コンテナ内でComfyUIのカスタムノードを操作できるようになります。

## 使用方法
コンテナ内でComfyUIが正常に動作している場合、以下のコマンドでComfyUIを起動します。
```bash
./run_comfyui.sh
```
これで、ブラウザでComfyUIのインターフェースにアクセスでき、AIレンダリングやカスタムノードが利用できるようになります。