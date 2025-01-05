.PHONY: serve pdf

export NVM_DIR=${HOME}/.nvm
export NODE_VERSION=v21
export PORT=3000
export NAME=`basename ${PWD}`

serve:
	python3 -m http.server -b 127.0.0.1 ${PORT}

pdf:
	. ${NVM_DIR}/nvm.sh && \
	nvm install ${NODE_VERSION} && \
	npm install -g decktape && \
	decktape remark http://127.0.0.1:${PORT}/ ${NAME}.pdf
