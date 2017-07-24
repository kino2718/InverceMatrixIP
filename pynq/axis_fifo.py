__author__ = "KINOMOTO, Masakazu"
__email__ = "kino2718@gmail.com"

from pynq import MMIO
from pynq import PL

### Register offset
# Interrupt Status Register
ISR_OFFSET = 0x00
# Transmit Data FIFO Reset
TDFR_OFFSET = 0x08
# Transmit Data FIFO Vacancy
TDFV_OFFSET = 0x0c
# Transmit Data FIFO 32-bit Wide Data Write Port
TDFD_OFFSET = 0x10
# Transmit Length Register
TLR_OFFSET = 0x14
# Receive Data FIFO reset
RDFR_OFFSET = 0x18
# Receive Data FIFO Occupancy
RDFO_OFFSET = 0x1c
# Receive Data FIFO 32-bit Wide Data Read Port
RDFD_OFFSET = 0x20
# Receive Length Register
RLR_OFFSET = 0x24
# AXI4-Stream Reset
SRR_OFFSET = 0x28

RESET_WRITE_VALUE = 0x000000a5
INT_ALL_MASK = 0xfff80000
# bit definitions of interrupt reg
INT_TRANSMIT_COMPLETE = 0x08000000

class AXISFifo:
    """This class controls Xilinx AXI4 Stream FIFO.
    """
    _mmio = None

    def __init__(self):
        """Create a new AXI4 Stream FIFO object.
        """
        if AXISFifo._mmio is None:
            base_addr = PL.ip_dict['SEG_axi_fifo_mm_s_0_Mem0'][0]
            length = 0x80
            AXISFifo._mmio = MMIO(base_addr, length)
        self.reset_tx()
        self.reset_rx()
        self.reset()

    def reset_tx(self):
        self._wreg(TDFR_OFFSET, RESET_WRITE_VALUE)

    def reset_rx(self):
        self._wreg(RDFR_OFFSET, RESET_WRITE_VALUE)
        
    def reset(self):
        self._wreg(SRR_OFFSET, RESET_WRITE_VALUE)

    def clear_int(self, mask):
        self._wreg(ISR_OFFSET, mask & INT_ALL_MASK)

    def int_status(self):
        return self._rreg(ISR_OFFSET)

    def get_tx_vacancy(self):
        return self._rreg(TDFV_OFFSET)

    def write(self, word):
        self._wreg(TDFD_OFFSET, word)

    def start_tx(self, nwords_packet):
        nbytes_packet = nwords_packet * 4
        self._wreg(TLR_OFFSET, nbytes_packet)

    def wait_tx_done(self):
        while(self.int_status() & INT_TRANSMIT_COMPLETE == 0):
            pass

    def get_rx_occupancy(self):
        return self._rreg(RDFO_OFFSET)
    
    def wait_rx_done(self, nwords_packet):
        while (self.get_rx_occupancy() != nwords_packet):
            pass

    def ready_to_read(self):
        return self._rreg(RLR_OFFSET)
    
    def read(self):
        return self._rreg(RDFD_OFFSET)
        
    @staticmethod
    def _wreg(addr, val):
        AXISFifo._mmio.write(addr, val)

    @staticmethod
    def _rreg(addr):
        return AXISFifo._mmio.read(addr)
