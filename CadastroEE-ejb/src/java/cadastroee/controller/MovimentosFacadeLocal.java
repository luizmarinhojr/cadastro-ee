/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package cadastroee.controller;

import cadastroee.model.Movimentos;
import jakarta.ejb.Local;
import java.util.List;

/**
 *
 * @author monster
 */
@Local
public interface MovimentosFacadeLocal {

    void create(Movimentos movimentos);

    void edit(Movimentos movimentos);

    void remove(Movimentos movimentos);

    Movimentos find(Object id);

    List<Movimentos> findAll();

    List<Movimentos> findRange(int[] range);

    int count();
    
}
