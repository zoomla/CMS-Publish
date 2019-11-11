@ECHO OFF

ECHO.&ECHO.Zoomla!逐浪CMS V8(基于.net Core)智能安装...
echo.安装前请检查是否安装了IIS和.net core托管程序
echo.推荐右键管理员身份运行,更多教程详见http://help.z01.com/v8
echo.
echo.接下来将执行以下几步：
echo.1-创建端口为98的[ZoomlaCMS_V8]站点，重名则删除重建。
echo.2-浏览器自动打开安装成功的站点，就能快速部署和使用Zoomla!逐浪CMS
echo.按任意键开始&PAUSE >NUL 2>NUL

echo.
cd /d "%windir%\system32\inetsrv"

::检测删除旧站点-如果有
Appcmd.exe Delete site ZoomlaCMS_V8
Appcmd.exe Delete apppool ZoomlaCMS_V8

::创建网站
Appcmd add site /name:"ZoomlaCMS_V8" /bindings:http://:98 /physicalpath:"c:\inetpub\wwwroot\zoomlacms\website"
Appcmd.exe Add AppPool /name:"ZoomlaCMS_V8"
Appcmd.exe Set app "ZoomlaCMS_V8/" /applicationpool:"ZoomlaCMS_V8"
Appcmd set apppool /apppool.name:ZoomlaCMS_V8 /enable32BitAppOnWin64:False
Appcmd set apppool /apppool.name:ZoomlaCMS_V8 /managedPipelineMode:Integrated

::设置.net core进程池为无托管
Appcmd set apppool /apppool.name:ZoomlaCMS_V8 /managedRuntimeVersion:""

::设置网站预加载
Appcmd set apppool /apppool.name:ZoomlaCMS_V8 /startMode:AlwaysRunning 
Appcmd set site  ZoomlaCMS_V8 /applicationDefaults.preloadEnabled:true 

::创建桌面网站图标
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\我的网站.lnk""):b.TargetPath=""http://localhost:98"":b.WorkingDirectory=""%~dp0"":b.Save:close")


ECHO.&ECHO.按任意键打开Web界面，否就直接关闭！&PAUSE >NUL 2>NUL

start http://localhost:98
