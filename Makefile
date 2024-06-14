# -*- mode: makefile -*-
# vim:ft=make:

OUTPUT_DIR = .
BASH_DEBUG_PREFACE ?= "In Poetry bash completion setup"
BASH_OUTPUT_FILENAME ?= poetry-completion-setup.bash
ZSH_DEBUG_PREFACE ?= "In Poetry zsh completion setup"
ZSH_OUTPUT_FILENAME ?= poetry-completion-setup.zsh

.PHONY : all
all : bash-completion zsh-completion

.PHONY : bash-completion
bash-completion :
	@echo Generating Poetry bash completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: bash -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(BASH_DEBUG_PREFACE)'" > $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME) &&\
	poetry completions bash >> $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)

.PHONY : zsh-completion
zsh-completion :
	@echo Generating Poetry ZSH completion setup script
	@/bin/echo -e "# -*- mode: sh; sh-shell: zsh -*-\\n\
# vim:ft=sh:\\n\
\\n\
# /bin/echo -e '$(ZSH_DEBUG_PREFACE)'\\n" > $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME) &&\
	poetry completions zsh >> $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)

.PHONY : clean
clean :
	rm -f $(OUTPUT_DIR)/$(BASH_OUTPUT_FILENAME)
	rm -f $(OUTPUT_DIR)/$(ZSH_OUTPUT_FILENAME)
