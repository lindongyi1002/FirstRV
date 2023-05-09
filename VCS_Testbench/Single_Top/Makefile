#tip 1: alias which in .bashrc is not support;
#tip 2:	can not add comments to shell cmd which in Makefile;
SHELL=/bin/bash

#**********************************************************************#

.PHONY: all compile simv clean #it is understood by make as not a file

all: compile simv
WORKPATH = ~/Gitee_Project/FirstRV/SingleCyProcessor

compile:
	#only vcs cmd cannot be executed because tip 1 above;
	vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed \
		$(WORKPATH)/RTL/SingleCyProcessor_Top.v \
		$(WORKPATH)/RTL/ALU32.v \
		$(WORKPATH)/RTL/DataMem.v \
		$(WORKPATH)/RTL/ImmGen.v \
		$(WORKPATH)/RTL/InstCtrl.v \
		$(WORKPATH)/RTL/PC.v \
		$(WORKPATH)/RTL/ALUCtrl.v \
		$(WORKPATH)/RTL/defines.v \
		$(WORKPATH)/RTL/InstMem.v \
		$(WORKPATH)/RTL/Registers.v \
		$(WORKPATH)/testbench/Single_Top_tb.v \
		$(WORKPATH)/RTL/defines.v \
		-debug_all

simv:
	./simv -gui

clean:
	rm -r csrc DVEfiles simv.daidir *.vpd simv *.key
