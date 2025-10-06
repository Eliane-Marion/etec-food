package br.com.etechas.etecfood.entity;

import br.com.etechas.etecfood.enums.StatusPagamentoEnum;
import jakarta.persistence.*;

    @Entity
    @Table(name = "Pagamento")
    public class Pagamento {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        private double valor;
        private String nome;
        private String numero;
        private String expiracao;
        private String codigo;
        @Enumerated(EnumType.STRING)
        private StatusPagamentoEnum status;
        @ManyToOne
        @JoinColumn(name = "formaPagamento_id")
        private FormaPagamento formaDePagamento;
    }
