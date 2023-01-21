# platform-infra

# manifest

## initialize

1. `make tool`でツールをインストール

1. [age](https://github.com/FiloSottile/age)で鍵を生成
  
    ```
    age-keygen
    ```

1. 公開鍵を`script/encrypt.sh`の`key`に設定

1. 秘密鍵を`Octeto`の`Settings` > `Secrets`に、`SOPS_AGE_KEY`という名前で設定

1. (ローカル)秘密鍵を`.secret.enc`に`SOPS_AGE_KEY`という名前で設定

## Add secret

1. `k8s/templates/secret/{secret}.yaml`を追加し下記の`yaml`を入力
    ```yaml
    apiVersion: v1
    kind: Secret
    metadata:
    name: platform-${secret}
    type: Opaque
    data:
        ${secret}: ""
    ```
1. `k8s/templates/secret/${secret}.in.txt`にシークレット値を設定
1. `make encrypt secret=${secret}`を実行
1. `octeto/sops.sh`のシークレットの復号化処理に`./sops --decrypt --in-place k8s/templates/secret{secret}.yaml`を追記

## Change secret

1. `k8s/templates/secret/${secret}.in.txt`にシークレット値を設定
1. `make encrypt secret=${secret}`を実行

## Confirm secret @Local
1. 秘密鍵を`.secret.enc`に`SOPS_AGE_KEY`という名前で設定
1. `make decrypt secret=${secret}`を実行
1. `k8s/templates/secret/${secret}.out.txt`を確認

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
