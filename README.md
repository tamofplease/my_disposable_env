# my_disposable_env

my disposable_env

## Quick start（新しい Mac で一発）

何もない Mac から:

```sh
curl -fsSL https://raw.githubusercontent.com/tamofplease/my_disposable_env/main/bootstrap.sh -o /tmp/bootstrap.sh
bash /tmp/bootstrap.sh
```

`bootstrap.sh` が Homebrew（= git も）導入 → この repo を **HTTPS で clone**（SSH 鍵不要）→ `make all` まで実行する。

既に repo を clone 済みなら:

```sh
make all   # = install（ツール+dotfiles） → setup_github → run_all（macOS defaults）
```

> SSH 鍵が無くても public repo は HTTPS で clone できる（zip download は不要）。
> 鍵は clone 後に `make setup_github` が生成・GitHub 登録する。

セットアップ後に手動で残るのは GUI 設定（下記）とターミナルのフォント選択のみ。

### Mac の環境設定(by GUI)

- screen saver を切る

  1. SystemPreference => Battery => Battery => Turn display off after(=> Slide to Never)
  2. SystemPreference => Desktop&Screen Saver => Screen Saver => remove check from `Show Screen Saver after`

- F1, F2 などのキーを通常の標準の fnKey として利用するように設定する

  1. SystemPreference > Keyboard > Keyboard > check `Use F1, F2, etc... checkbox.`

- 各画面にショートカットを割り当てる

  1. デスクトップを 10 画面作成

  2. ショートカットの設定を行う。

     SystemPreference > Keyboard > Shortcuts > Mission Controll > Check all checkbox to switch Desktop x

  3. スペースの自動並び替えを off にする

  SystemPreference > MissionControl > remove check from `Automatically Rearrange Spaces...`

  4. 各 app を複数画面に割り当てる(任意)

- bottomNav を default で非表示にする

  1. SystemPreference > Dock & Menu Bar > Dock & Menu Bar

    <img src="https://user-images.githubusercontent.com/55216047/156952798-00974962-ef28-42cb-8d68-927209fbb5c6.png" height="200">


- keyboard の shortcut 編集

  1. SystemPreference > Keyboard > Shortcuts > App Shortcuts

     ![Screen Shot 2022-04-29 at 10 41 02](https://user-images.githubusercontent.com/55216047/165873070-c842fddf-9e00-4299-8a5b-5f44bf7cb425.png)

### 手作業で install 系

- [chrome](https://www.google.com/chrome/?brand=CHBD&brand=SSPA&gclid=CjwKCAiA1JGRBhBSEiwAxXblwbR0wHVSOQkhO58aEsUIs-03iS6GZvxQlf2ahaO6oztFLXuzs84-phoCuCgQAvD_BwE&gclsrc=aw.ds)

### Mac の環境設定(by CGI)

- GitHub / SSH / git の設定

  1. この project を clone
  2. `make install`（`gh` を含む各種ツールを install）
  3. `make setup_github` を実行する

  `make setup_github`（= `github.sh`）が以下を一括でやる:

  - git の identity / 便利な default（`init.defaultBranch=main`, `pull.rebase`,
    `push.autoSetupRemote` 等）を設定
  - ed25519 鍵を生成（既にあればスキップ）し、`~/.ssh/config` を配置
  - 鍵を ssh-agent + macOS Keychain に登録
  - `gh auth login`（未ログインなら）→ `gh ssh-key add` で公開鍵を GitHub に自動登録
  - `ssh -T git@github.com` で疎通確認

- zsh の設定

  `make install`（= `install.sh`）が dotfiles も配置するので通常は追加作業不要:
  `zsh/zshrc` → `~/.zshrc`、`zsh/completion` → `~/.zsh/`、`config/*` → `~/.config/`。
  反映は `source ~/.zshrc` かターミナル再起動。

  zsh だけ入れ直したいときは `make load_zsh`（同じファイルを copy するだけ）。

  プロンプトは [starship](https://starship.rs/)。`zsh/zshrc` が starship / volta / rustup の
  有効化を担う唯一のソースで、設定本体は `config/starship.toml` → `~/.config/starship.toml`。

  glyph を正しく表示するために Nerd Font を入れる

  1. `make fix_font`（Hack Nerd Font を install）
  2. Warp > Settings > Appearance > Text > Terminal font で `Hack Nerd Font` を選択する。

### brew の install

- [brew](https://brew.sh/)

### 必要な tool / app の install

各種 CLI・アプリ（Homebrew cask/formula + Claude Code・gcloud の native installer）は
`install.sh` にまとまっている。

```sh
make install   # = bash install.sh
```

中身は `install.sh` を参照。Claude Code と gcloud は自己アップデート/コンポーネント管理の都合で
brew ではなく native installer 経由で入れている。

任意で追加するもの:

- VSCode `brew install --cask visual-studio-code`
- Clipy `brew install --cask clipy`

#### 言語ツールチェイン（`install.sh` に含む）

| 対象 | 管理ツール | 備考 |
| --- | --- | --- |
| Python | [uv](https://docs.astral.sh/uv/) | 版管理 + venv + pip/pipx を一元化。`uv python install 3.12` 等 |
| Node | [volta](https://volta.sh/) | `package.json` にバージョンを pin |
| pnpm | volta | `VOLTA_FEATURE_PNPM=1` を zshrc に追記して有効化 |
| TypeScript | volta | `volta install typescript`（tsc 提供） |
| Rust | [rustup](https://rustup.rs/) | toolchain/target/component を管理 |
