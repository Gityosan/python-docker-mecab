# docker-jupyter-notebook

`docker compose up`で立ち上げ後、localhost:889にアクセス。

## mecab の練習


`git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git`でmecab-ipadic-neologdを引っ張ってくる


辞書のルートパス確認

`mecab-config --dicdir`

コンテナからローカルへのコピー(基本は上書き)

`docker ps`でコンテナID/コンテナ名を調べた後、

`docker cp <docker id>:/home/jovyan/mecab-python3.ipynb $PWD/work`

or

`docker cp <docker names>:/home/jovyan/mecab-python3.ipynb $PWD/work`

`docker cp mecab-notebook:/home/jovyan/mecab-python3.ipynb $PWD/work`


docker comtainer内のファイルの場所が分からない場合

`find / -name ファイル名`


初回立ち上げ時Token取得

`docker exec -it mecab-notebook bash`

`jupyter server list`

vscodeでdocker立ち上げ
- そうしないと、ファイルの同期がされなくなる