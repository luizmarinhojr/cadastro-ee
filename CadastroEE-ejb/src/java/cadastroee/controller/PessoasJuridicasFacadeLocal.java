/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cadastroee.controller;

import cadastroee.model.PessoasJuridicas;
import jakarta.ejb.Local;
import java.util.List;

/**
 *
 * @author monster
 */
@Local
public interface PessoasJuridicasFacadeLocal {

    void create(PessoasJuridicas pessoasJuridicas);

    void edit(PessoasJuridicas pessoasJuridicas);

    void remove(PessoasJuridicas pessoasJuridicas);

    PessoasJuridicas find(Object id);

    List<PessoasJuridicas> findAll();

    List<PessoasJuridicas> findRange(int[] range);

    int count();
    
}
