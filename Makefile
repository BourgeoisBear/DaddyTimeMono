DIR_LOCAL  := $(HOME)/.fonts
DIR_OBJ    := ./build
DIR_REMOTE := /cygdrive/d/_JASON_DOCUMENTS/Desktop
ROOT_NAME  := DaddyTimeMono

SRC_FILE   := ./${ROOT_NAME}-ttf.sfd
TTF_FILE   := ${DIR_OBJ}/${ROOT_NAME}.ttf
TTF_HINTED := ${DIR_OBJ}/${ROOT_NAME}.hinted.ttf

${TTF_HINTED}: ${TTF_FILE}
	ttfautohint -v -W ${TTF_FILE} ${TTF_HINTED}

${TTF_FILE}: ${SRC_FILE}
	fontforge -lang=ff -script ./makettf.ffscript ${SRC_FILE} ${TTF_FILE}

remote:
	chmod ug+x ${DIR_OBJ}/*.ttf
	scp ${TTF_HINTED} newcore:${DIR_REMOTE}/${ROOT_NAME}.ttf

local:
	cp ${TTF_HINTED} ${DIR_LOCAL}/${ROOT_NAME}.ttf

clean:
	rm -f ${DIR_OBJ}/*.ttf
