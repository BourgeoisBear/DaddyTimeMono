DIR_OBJ    := ./build
DIR_REMOTE := /cygdrive/d/_JASON_DOCUMENTS/Desktop
ROOT_NAME  := DaddyTimeMono

SRC_FILE   := ./${ROOT_NAME}-ttf.sfd
TTF_FILE   := ${DIR_OBJ}/${ROOT_NAME}.ttf
TTF_HINTED := ${DIR_OBJ}/${ROOT_NAME}.hinted.ttf

${TTF_HINTED}: ${TTF_FILE}
	ttfautohint -v -n -i -W ${TTF_FILE} ${TTF_HINTED}
	chmod ug+x $@

${TTF_FILE}: ${SRC_FILE}
	fontforge -lang=ff -script ./makettf.ffscript ${SRC_FILE} ${TTF_FILE}
	chmod ug+x $@

remote: ${TTF_HINTED}
	scp $< newcore:${DIR_REMOTE}/${ROOT_NAME}.ttf

local: ${TTF_HINTED}
	sudo cp $< /usr/share/fonts/truetype/${ROOT_NAME}.ttf

clean:
	rm -f ${DIR_OBJ}/*.ttf
