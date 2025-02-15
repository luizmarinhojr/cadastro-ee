/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cadastroee.controller;

import cadastroee.model.PessoasFisicas;
import jakarta.ejb.Local;
import java.util.List;

/**
 *
 * @author monster
 */
@Local
public interface PessoasFisicasFacadeLocal {

    void create(PessoasFisicas pessoasFisicas);

    void edit(PessoasFisicas pessoasFisicas);

    void remove(PessoasFisicas pessoasFisicas);

    PessoasFisicas find(Object id);

    List<PessoasFisicas> findAll();

    List<PessoasFisicas> findRange(int[] range);

    int count();
    
}
