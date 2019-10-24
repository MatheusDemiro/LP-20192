package concorrencia.ex6;

public class Decrementador extends Thread {
	private Contador c;
	
	public Decrementador(Contador c) {
		this.c = c;
	}
	
	@Override
	public void run() {
		c.decr();
	}

}
