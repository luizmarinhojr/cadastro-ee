/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cadastroee.controller;

import cadastroee.model.Pessoas;
import jakarta.ejb.Local;
import java.util.List;

/**
 *
 * @author monster
 */
@Local
public interface PessoasFacadeLocal {

    void create(Pessoas pessoas);

    void edit(Pessoas pessoas);

    void remove(Pessoas pessoas);

    Pessoas find(Object id);

    List<Pessoas> findAll();

    List<Pessoas> findRange(int[] range);

    int count();
    
}
