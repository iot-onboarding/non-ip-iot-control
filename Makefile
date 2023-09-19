DOCS=	draft-brinckman-nipc.txt \
	draft-brinckman-nipc.xml \
	draft-brinckman-nipc.html

FTXT=

YAML=  nipc-openapi/NIPC_operations.yaml

all: $(DOCS)

%.xml:	%.mkd  $(YAML)
	kramdown-rfc2629 -3 $< > $@

%.html %.txt:	%.xml
	xml2rfc --html $<
	xml2rfc --text $<

%.ftxt: %.json $(JSON)
	python3 fold.py < $< > $@
