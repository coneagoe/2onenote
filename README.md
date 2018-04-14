# 2onenote
Import local html to onenote

Inspired by [WizNote2OneNote](https://github.com/Rubioo/WizNote2OneNote)

## Usage
### 准备工作
先将要导入的为知笔记文件下载到本地。(可打开为知笔记程序，执行脚本download_WizNote，其中loop次数是你的note个数。)

Tips
先手动执行F8看能不能跳到下一份笔记。(我试下来左边侧边栏的位置是可以的，请自行调整鼠标位置。)

笔记下载好后，修改脚本WizNote2OneNote，指定笔记目录。例如我是放在E:\backup\wiznote下，则修改
```VB
Loop Files, E:\backup\wiznote\4\*.htm, R ;loop index.htm
```

Tips
将笔记分开放在不同的目录中，这样如果后面import有问题，也只需要单独重新import那个目录下的笔记即可。例如例子中我分了4个子目录。

退出Ditto等clipboard记录程序

**断网** (因为OneNote会自动同步。一时间import大量文件，会造成OneNote卡死。)

### import
打开OneNote，创建一个新的Tab(我是重新创建了一个Notebook)。执行WizNote2OneNote。按ctrl-F1开始import，如果要停止按ctrl-F2。

该脚本也可以import其他一些笔记到onenote，比如ScrapBook。请自行研究。