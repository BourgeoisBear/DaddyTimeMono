DIR_OBJ    := ./build
ROOT_NAME  := DaddyTimeMono

SRC_FILE   := ./${ROOT_NAME}-ttf.sfd
TTF_FILE   := ${DIR_OBJ}/${ROOT_NAME}.nohint.ttf
TTF_HINTED := ${DIR_OBJ}/${ROOT_NAME}.ttf

${TTF_HINTED}: ${TTF_FILE}
	ttfautohint -v -n -i -W ${TTF_FILE} ${TTF_HINTED}
	chmod ug+x $@

${TTF_FILE}: ${SRC_FILE}
	fontforge -lang=ff -script ./makettf.ffscript ${SRC_FILE} ${TTF_FILE}

clean:
	rm -f ${DIR_OBJ}/*.ttf
	rm -f ./*.sfd-*
