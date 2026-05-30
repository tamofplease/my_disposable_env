# my_disposable_env

my disposable_env

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

- ssh の設定

  1. この project を clone
  2. `make genSshEnv`をうつ(pub key が copy される)
  3. github の [setting](https://github.com/settings/keys) から pubKey を設定する
  4. `ssh -T git@github.com` で疎通確認

- zsh の設定

  1. `make prepare_zsh`で zsh に必要な dir の作成
  2. `make load_zsh`で設定周りのファイルを copy（zshrc / completion / starship.toml）
  3. `source ~/.zshrc`で変更を反映

  プロンプトは [starship](https://starship.rs/) を使用（`install.sh` で install 済み）。
  設定は `zsh/starship.toml` → `~/.config/starship.toml`。

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

#### for develop frontEnd

#### for develop backend

#### for develop mobileApp

#### for ML

#### for research

#### other
