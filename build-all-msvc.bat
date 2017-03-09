@echo off
SET VALID=0
SET CHECKQTVERTOOL=bin/is580-debug.exe
if [%1] EQU [Debug]  SET VALID=1
if [%1] EQU [Release]  SET VALID=1
if [%1] EQU [Release] SET CHECKQTVERTOOL=bin/is580-release.exe
if [%VALID%] EQU [0]  (
	echo Build script for all libraries for Microsoft Visual C++. Just run it from Command line of Visual Studio  
    echo Syntax:
	echo build-all-msvc.bat "[Debug|Release]"
	exit /B 1
)
@echo on
devenv libsaddy.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tools/atlasgen/atlasgen.vcxproj /Build %1 /out lastsolutionbuild.log
devenv plugins/dukpp-03/dukpp-03.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tools/exporter/exporter.vcxproj /Build %1 /out lastsolutionbuild.log
devenv plugins/freetype/saddy-ft.vcxproj /Build %1 /out lastsolutionbuild.log
devenv plugins/irrklang/irrklang.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tools/ifaceed/ifaceed/ifaceed.vcxproj /Build %1 /out lastsolutionbuild.log
devenv examples/game/game.vcxproj /Build %1 /out lastsolutionbuild.log
devenv examples/multithreading/multithreading.vcxproj /Build %1 /out lastsolutionbuild.log
devenv examples/stress-physics/stress-physics.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/animations/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/db/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/dukpp-03/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/freetype/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/hfsm/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/input/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/irrklang/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/p2d/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/pipeline/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/resource/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/sad/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tests/layouts/alltests.vcxproj /Build %1 /out lastsolutionbuild.log
devenv tools/is580/is580.vcxproj  /Build %1 /out lastsolutionbuild.log
%CHECKQTVERTOOL%
if errorlevel 1 (
	devenv plugins/qt/qt-widget.vcxproj  /Build %1 /out lastsolutionbuild.log
	devenv examples/example-game-in-qt/example-game-in-qt.vcxproj  /Build %1 /out lastsolutionbuild.log
)