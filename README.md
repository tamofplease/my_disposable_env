# my_disposable_env
my disposable_env

### Macの環境設定(by GUI)

- screen saverを切る

  1. SystemPreference => Battery => Battery => Turn display off after(=> Slide to Never)
  2. SystemPreference => Desktop&Screen Saver => Screen Saver => remove check from ```Show Screen Saver after```

- F1, F2などのキーを通常の標準のfnKeyとして利用するように設定する

  1. SystemPreference > Keyboard > Keyboard > check ```Use F1, F2, etc... checkbox.```

- 各画面にショートカットを割り当てる

  1. デスクトップを10画面作成

  2. ショートカットの設定を行う。

     SystemPreference > Keyboard > Shortcuts > Mission Controll > Check all checkbox to switch Desktop x

  3. スペースの自動並び替えをoffにする

    SystemPreference > MissionControl > remove check from ```Automatically Rearrange Spaces...```

  4. 各appを複数画面に割り当てる(任意)


- bottomNavをdefaultで非表示にする

  1. SystemPreference > Dock & Menu Bar > Dock & Menu Bar
  
    <img src="https://user-images.githubusercontent.com/55216047/156952798-00974962-ef28-42cb-8d68-927209fbb5c6.png" height="200">

### 手作業でinstall系

- [chrome](https://www.google.com/chrome/?brand=CHBD&brand=SSPA&gclid=CjwKCAiA1JGRBhBSEiwAxXblwbR0wHVSOQkhO58aEsUIs-03iS6GZvxQlf2ahaO6oztFLXuzs84-phoCuCgQAvD_BwE&gclsrc=aw.ds)

- [iterm2](https://iterm2.com/)



### Macの環境設定(by CGI)

- sshの設定

  1. このprojectをclone
  2. ```make genSshEnv```をうつ(pub keyがcopyされる)
  3. githubのsettingからpubKeyを設定する
  4. ```ssh -T git@github.com``` で疎通確認


- zshの設定

  1. ```make prepare_zsh```でzshに必要なdirの作成
  2. ```make load_zsh```で設定周りのファイルをcopy
  3. ```source ~/.zshrc```で変更を反映

  文字化けを治すために
  1. ```make fix_font```
  2. iterm2 > preference > profile > text > fontで Dejavu Sans mono for ....を選択する。

  ref: https://dev.macha795.com/zsh-prompt-customize/
  
### brew のinstall

- [brew](https://brew.sh/)

### 必要なtoolのinstall

- make 

- VSCode ```brew install --cask visual-studio-code```

- Clipy ```brew install --cask clipy```

- Alfred ```brew install --cask alfred```

- Docker ```brew install docker```
- 



#### for Competitive Programming

#### for develop frontEnd


#### for develop backend


#### for develop mobileApp

#### for ML

#### for research


#### other



