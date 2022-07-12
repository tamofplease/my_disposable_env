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

- [iterm2](https://iterm2.com/)

### Mac の環境設定(by CGI)

- ssh の設定

  1. この project を clone
  2. `make genSshEnv`をうつ(pub key が copy される)
  3. github の setting から pubKey を設定する
  4. `ssh -T git@github.com` で疎通確認

- zsh の設定

  1. `make prepare_zsh`で zsh に必要な dir の作成
  2. `make load_zsh`で設定周りのファイルを copy
  3. `source ~/.zshrc`で変更を反映

  文字化けを治すために

  1. `make fix_font`
  2. iterm2 > preference > profile > text > font で Dejavu Sans mono for ....を選択する。

  ref: https://dev.macha795.com/zsh-prompt-customize/

### brew の install

- [brew](https://brew.sh/)

### 必要な tool の install

- make install_tool

- VSCode `brew install --cask visual-studio-code`

- Clipy `brew install --cask clipy`

- Alfred `brew install --cask alfred`

- Docker `brew install docker`
-

#### for Competitive Programming

1. VSCode の lib 設定

- `xaver.clang-format`の install

- `notskm.clang-tidy`の install

2. VSCode の snippet 設定

- `make install_cp

#### for develop frontEnd

#### for develop backend

#### for develop mobileApp

#### for ML

#### for research

#### other
