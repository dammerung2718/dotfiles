.PHONY: help ## print this
help:
	@echo ""
	@echo "Usage:"
	@echo "  make \033[34m<command>\033[0m"
	@echo ""
	@echo "Commands:"
	@grep '^.PHONY: ' Makefile | sed 's/.PHONY: //' | awk '{split($$0,a," ## "); printf "  \033[34m%0-10s\033[0m %s\n", a[1], a[2]}'
	@echo ""

.PHONY: sync ## sync environment
sync:
	scripts/sync

.PHONY: clone ## clone my repositories into $HOME/personal
clone:
	@git config --global credential.helper 'cache --timeout=60s'
	@if test -z "${USERNAME}"; then    \
		echo "$$USERNAME is empty";    \
		exit 1;                        \
	fi
	@mkdir -p $$HOME/personal
	@cd $$HOME/personal                                                                           \
		&& gh repo list ${USERNAME} --limit 4000 --json nameWithOwner --jq '.[].nameWithOwner'    \
		| grep -v 'dotfiles'                                                                      \
		| xargs -L 1 gh repo clone

.PHONY: generate ## generate package script files
generate:
	scripts/generate

.PHONY: clean ## clean package script files
clean:
	rm -f Brewfile Brewfile.lock.json Dnffile
