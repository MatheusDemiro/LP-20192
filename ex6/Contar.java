package concorrencia.ex6;

public class Contar extends Thread {
	private ContadorSync c;
	private TipoOperacao operacao;
	private boolean negativo;
	
	public Contar (ContadorSync c, boolean neg, TipoOperacao operacao) {
		this.c = c;
		this.setOperacao(operacao);
		this.negativo = neg;
	}

	@Override
	public void run() {
		if (this.operacao == TipoOperacao.INCREMENTAR) {
			c.incr();
		} else {
			c.decr(this.negativo);
		}
	}

	public TipoOperacao getOperacao() {
		return operacao;
	}

	public void setOperacao(TipoOperacao operacao) {
		this.operacao = operacao;
	}

	public boolean isNegativo() {
		return negativo;
	}

	public void setNegativo(boolean negativo) {
		this.negativo = negativo;
	}
}
