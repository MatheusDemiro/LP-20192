package concorrencia.ex6;

import concorrencia.util.ThreadsList;

/**
 * Exemplo com vários incrementadores que incrementam um contador não-sincronizado e sincronizado paralelamente.
 * @author gabri
 */
public class Application {

	public static void main(String[] args) throws Exception {
		int MAX = 3;
//		executarContador(MAX, new ContadorSync(MAX));
		executarContador(MAX, new ContadorSync(MAX));
	}

	/**
	 * 
	 */
	private static void executarContador(int max, ContadorSync contador) {
		ThreadsList<Contar> threadsList = new ThreadsList<Contar>();
		for (int i = 1; i <= max; i++) {
			//Definir o boolean para true caso tenha mais decrementadores do que incrementadores.
			//Com isso sera aceito numeros negativos.
			threadsList.add(new Contar(contador, false, TipoOperacao.INCREMENTAR));
			threadsList.add(new Contar(contador, false, TipoOperacao.DECREMENTAR));
			threadsList.add(new Contar(contador, false, TipoOperacao.DECREMENTAR));
			threadsList.add(new Contar(contador, false, TipoOperacao.INCREMENTAR));
		}
		threadsList.start();
		threadsList.join();
		System.out.println("Contagem de 1 a " + max + " com " + contador);
		System.out.println("Valor encontrado: " + contador.getValor());
	}

}
