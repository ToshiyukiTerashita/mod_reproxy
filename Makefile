APXS=`find /usr -name apxs 2>&1|grep -v find|head -1`
APXS_FLAGS=-Wc,-Wall -Wc,-O3 -lcurl

SRC=mod_reproxy.c

$(SRC:c=o): $(SRC)
	$(APXS) -c $(APXS_FLAGS) $(SRC)

install:
	$(APXS) -cai $(APXS_FLAGS) $(SRC)

clean:
	rm -f $(SRC:c=o) $(SRC:c=la) $(SRC:c=lo) $(SRC:c=slo)
