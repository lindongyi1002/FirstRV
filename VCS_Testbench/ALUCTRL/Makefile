#RULE 1: alias which in .bashrc is not support
SHELL=/bin/bash


.PHONY: all compile simv clean #it is understood by make as not a file
all: compile simv
compile:
	vcs -full64 -cpp g++-4.8 -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed \ #only vcs cmd cannot be executed because RULE 1 above;
		~/Gitee_Project/FirstRV/SingleCyProcessor/RTL/ALUCtrl.v \
		~/Gitee_Project/FirstRV/SingleCyProcessor/RTL/ALU32.v \
		~/Gitee_Project/FirstRV/SingleCyProcessor/testbench/ALUCTRL_tb.v \
		-debug_all

simv:
	./simv -gui

clean:
	rm -r csrc DVEfiles simv.daidir *.vpd simv *.key
