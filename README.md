# platform-infra

# manifest

## initialize

1. `make tool`でツールをインストール

1. [age](https://github.com/FiloSottile/age)で鍵を生成
  
    ```
    age-keygen
    ```

1. 公開鍵を`Makefile`の`AGE_PUBLIC_KEY`に設定

1. 秘密鍵を`Octeto`の`Settings` > `Secrets`に、`SOPS_AGE_KEY`という名前で設定

## Add secret

1. `secret-{シークレット名}.yaml`を追加し、`data.{シークレット名}`に対応するシークレット値を入れる
2. `make encrypt secret-{シークレット名}.yaml`を実行
3. `scripts/sops.sh`のシークレットの復号化処理に`./sops --decrypt --in-place k8s/templates/secret-{シークレット名}.yaml`を追記

## Change secret

1. `secret-{シークレット名}.yaml`の`data.{シークレット名}`を新しい値に書き換える
2. `make encrypt secret-{シークレット名}.yaml`を実行


## decode secret value

```sh
echo -n 'pMnnWGgA9X2-SuzzRuDnW3DNaKrcw8' | base64
```

# terraform

## Initialize

0. https://app.terraform.io/app
1. `Create a workspace`
2. chose `API-driven workflow`
3. Workspace Name: platform-$ENV
4. Settings > General > Execution Mode -> change Local -> `Save settings`

## Install

```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```
