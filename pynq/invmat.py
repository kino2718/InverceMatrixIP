import axis_fifo as fifo

class InvMat:
    def __init__(self, size):
        self.fifo = fifo.AXISFifo()
        self.matlen = size * size

    def inv(self, mat):
        if (len(mat) != self.matlen):
            print("Error: mat size is invalid.")
            raise
        
        self.fifo.clear_int(0xffffffff)
        sts = self.fifo.int_status()
        if (sts != 0):
            print("Error: interrupt status register could not clear.")
            raise
        
        mat7Q8 = [int(mat[i]*256) for i in range(self.matlen)]
        
        for el in mat7Q8:
            if(self.fifo.get_tx_vacancy()):
                self.fifo.write(el)
            else:
                print("Error: tx fifo is not vacancy.")
                raise

        self.fifo.start_tx(self.matlen)

        self.fifo.wait_tx_done()
        self.fifo.wait_rx_done(self.matlen)
        nbytes = self.fifo.ready_to_read()
        m_inv = [None for i in range(self.matlen)]
        for i in range(self.matlen):
            val = self.fifo.read()
            if (val & 0x8000):
                val -= 0x10000
            m_inv[i] = val/256
            
        return m_inv
