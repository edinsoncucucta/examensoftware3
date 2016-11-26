/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JSon;

/**
 *
 * @author EDINSON
 */
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author amartinez
 */
public class JQGridRow implements Serializable{
    private Integer id;
    private List cell;

    /**
     * @return the id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return the cell
     */
    public List getCell() {
        return cell;
    }

    /**
     * @param cell the cell to set
     */
    public void setCell(List cell) {
        this.cell = cell;
    }
}