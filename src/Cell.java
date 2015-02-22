import java.util.TreeSet;


/**
 * Created by IntelliJ IDEA.
 * User: Юрий
 * Date: 01.02.15
 * Time: 6:25
 * To change this template use File | Settings | File Templates.
 */
class Cell implements Cloneable{
    private Integer integer;
    private TreeSet<Integer> set = new TreeSet<Integer>();      //set of possible values
    private int sectorNumber;
    private boolean foundInt;
    private boolean checkedInt;

    public Cell(Integer i) {
        if(i != 0) {
            set = null;
            integer = i;
            foundInt = true;
            checkedInt = false;
        }   else {
            for(int k = 1; k < 10; k++) {
                set.add(k);
            }
            integer = 0;
            foundInt = false;
            checkedInt = false;
        }

    }

    public void setSectorNumber(int sectorNumber) {
        this.sectorNumber = sectorNumber;
    }

    public int getSectorNumber() {
        return sectorNumber;
    }

    public boolean getFound() {
        return foundInt;
    }

    public boolean getChecked() {
        return checkedInt;
    }

    public void setCheckedTrue() {
        checkedInt = true;
    }

    public boolean check(Integer j) {                  //Find j in the set of this cell's possible numbers and remove it
        if (!foundInt) {
            if(!set.contains(j))
                return false;
            set.remove(j);
            if(set.size() == 1) {                   //If there is only one possible number, the right one is found!
                integer = set.iterator().next();
                foundInt = true;
            }
            return true;

        }
        return false;
    }

    public Object getValue() {      //Return found number if it was found and the set of possible numbers if wasn't
        if(foundInt)
            return integer;
        else return set;
    }

    public boolean contains(Integer num) {
        return foundInt ? false : set.contains(num);
    }

    public void setUnique(Integer num) {
        foundInt = true;
        integer = num;
        set.clear();
    }

    public Cell clone() throws CloneNotSupportedException {
        Cell cell = (Cell)super.clone();
        if(set != null)
            cell.set = (TreeSet<Integer>)set.clone();
        return cell;
    }
}
