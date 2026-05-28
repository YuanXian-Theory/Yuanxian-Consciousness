COQC = coqc
COQFLAGS = -Q . YuanxianConsciousness

FILES = Basic.v T64Topology.v Dynamics.v Hierarchy.v Theorems.v

all: $(FILES:.v=.vo)

%.vo: %.v
	$(COQC) $(COQFLAGS) $<

clean:
	rm -f *.vo *.vos *.vok *.glob
