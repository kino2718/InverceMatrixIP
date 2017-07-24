# 順番が大切。下位のモジュールから並べる。
modules := \
	module/Feedback \
	module/LastCellValue \
	module/SignInverter \
	module/BoundaryCell \
	module/InternalCell \
	module/StreamToColumns2 \
	module/QRDecomp2 \
	module/PrependInit \
	module/Divider2FixedPoint \
	module/AXI4StreamRegister \
	module/DivCell \
	module/MultiplySubtractor \
	module/MulSubCell \
	module/MulSubCellTerm \
	module/ParallelToStream2 \
	module/LimitNumData \
	module/BackSubtraction2 \
	module/Reorder2 \
	module/InverceMatrix2 \
	module/StreamToColumns3 \
	module/QRDecomp3 \
	module/ParallelToStream3 \
	module/BackSubtraction3 \
	module/Reorder3 \
	module/InverceMatrix3

pynq_projects := \
	PYNQ/PynqInverceMatrix2 \
	PYNQ/PynqInverceMatrix3

.PHONY: all clean $(modules) $(pynq_projects)

all: $(modules) $(pynq_projects)

$(modules) $(pynq_projects):
	$(MAKE) --directory=$@

clean:
	for d in $(modules) $(pynq_projects); \
	do \
		$(MAKE) --directory=$$d clean; \
	done
