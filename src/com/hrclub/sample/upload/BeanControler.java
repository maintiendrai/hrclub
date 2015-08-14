
/**
 * 本例程演示了通过Web上传文件过程中的进度显示。您可以对本例程进行任何修改和使用。
 * 如果需要转载本例程，请您注明作者。
 *
 * 作者： 刘作晨
 * EMail:liuzuochen@gmail.com
 */

package com.hrclub.sample.upload;

/**
 * <p>Title: 类控制器</p>
 *
 * <p>Description: 主要作用是对FileUploadStatus进行管理，为客户端提供相应的
 * FileUploadStatus类对象。这是一个单例类。</p>
 *
 */
import java.util.Vector;

public class BeanControler {
    private static BeanControler beanControler = new BeanControler();
    private Vector vector = new Vector();
    private BeanControler() {
    }

    public static BeanControler getInstance() {
        return beanControler;
    }

    /**
     * 取得相应FileUploadStatus类对象的存储位置
     */
    private int indexOf(String strID) {
        int nReturn = -1;
        for (int i = 0; i < vector.size(); i++) {
            FileUploadStatus status = (FileUploadStatus) vector.elementAt(i);
            if (status.getUploadAddr().equals(strID)) {
                nReturn = i;
                break;
            }
        }
        return nReturn;
    }
    /**
     * 取得相应FileUploadStatus类对象
     */
    public FileUploadStatus getUploadStatus(String strID) {
        return (FileUploadStatus) vector.elementAt(indexOf(strID));
    }
    /**
     * 存储FileUploadStatus类对象
     */
    public void setUploadStatus(FileUploadStatus status) {
        int nIndex = indexOf(status.getUploadAddr());
        if ( -1 == nIndex) {
            vector.add(status);
        } else {
            vector.insertElementAt(status, nIndex);
            vector.removeElementAt(nIndex + 1);
        }
    }
    /**
     * 删除FileUploadStatus类对象
     */
    public void removeUploadStatus(String strID){
        int nIndex = indexOf(strID);
        if(-1!=nIndex)
            vector.removeElementAt(nIndex);
    }
}
