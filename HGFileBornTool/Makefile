

cp:FileBornTool
	@chmod + Release/
	@cp Release/HGFileBornTool /usr/local/bin/fpy
	@cp Release/HGFileBornTool /usr/local/bin/fsh

FileBornTool:
	@clang -fobjc-arc -framework Foundation HGFileBornTool/main.m -o Release/HGFileBornTool