.PHONY: setup
setup:
ifeq ($(TOKEN),)
	exercism configure --workspace=$(PWD)
else
	exercism configure --workspace=$(PWD) --token=$(TOKEN)
endif
