package concorrencia.ex6;

public class ContadorSync extends Contador {
	private int limite;
	
	public ContadorSync(int limite) {
		this.setLimite(limite);
	}
	
	//Este metodo nao tem restricao para incrementar.
	public synchronized void incr() {
		while (this.getValor() == this.getLimite()) {
			try {
				wait();
			} catch (InterruptedException e) {
				Thread.currentThread().interrupt();
			}
		}
		super.incr();
		notifyAll();
	}
	
	//Permite numero negativo quando tiver mais decrementadores do que incrementadores.
	public synchronized void decr(boolean negativo) {
		while (this.getValor() == 0 && !negativo) {
			try {
				wait();
			} catch (InterruptedException e) {
				Thread.currentThread().interrupt();
			}
		}
		super.decr();
		notifyAll();
	}

	public int getLimite() {
		return limite;
	}

	public void setLimite(int limite) {
		this.limite = limite;
	}
}
