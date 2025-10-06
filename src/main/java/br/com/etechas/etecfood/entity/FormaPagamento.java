package br.com.etechas.etecfood.entity;

import br.com.etechas.etecfood.enums.TipoFormaPagamentoEnum;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
@Entity
@Table(name = "FormaPagamento")
public class FormaPagamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    @Enumerated(EnumType.STRING)
    private TipoFormaPagamentoEnum tipo;
}
