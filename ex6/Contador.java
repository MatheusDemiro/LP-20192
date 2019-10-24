package concorrencia.ex6;

public class Contador {
	private int valor;

	public void incr() {
		synchronized(String.class) {
			valor++;
		}
	}
	public void decr() {
		valor--;
	}
	public int getValor() {
		return valor;
	}
}
