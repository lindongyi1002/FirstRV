#RULE 1: alias which in .bashrc is not support
SHELL=/bin/bash

#**********************************************************************#

.PHONY: all compile simv clean #it is understood by make as not a file

all: compile simv
WORKPATH = ~/Gitee_Project/FirstRV/SingleCyProcessor

compile:
	vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed \ #only vcs cmd cannot be executed because RULE 1 above;
		#Top
		$(WORKPATH)/RTL/SingleCyProcessor_Top.v \
		#submodule
		$(WORKPATH)/RTL/ALU32.v \
		$(WORKPATH)/RTL/DataMem.v \
		$(WORKPATH)/RTL/ImmGen.v \
		$(WORKPATH)/RTL/InstCtrl.v \
		$(WORKPATH)/RTL/PC.v \
		$(WORKPATH)/RTL/ALUCtrl.v \
		$(WORKPATH)/RTL/defines.v \
		$(WORKPATH)/RTL/InstMem.v \
		$(WORKPATH)/RTL/Registers.v \
		#tb
		$(WORKPATH)/testbench/.v \
		-debug_all

simv:
	./simv -gui

clean:
	rm -r csrc DVEfiles simv.daidir *.vpd simv *.key
