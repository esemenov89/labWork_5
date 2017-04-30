package code.services;

import code.model.dao.StorageUnitDAO;
import code.model.dao.StorageUnitDAOImpl;
import code.model.pojo.StorageUnit;
import code.model.pojo.User;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by admin on 22.04.2017.
 */
@Service
public class StorageUnitServiceImpl implements StorageUnitService {

    private StorageUnitDAO storageUnitDAO;

    @Autowired
    public void setStorageUnitDAO(StorageUnitDAO storageUnitDAO) {
        this.storageUnitDAO = storageUnitDAO;
    }

    @Override
    public HashSet<StorageUnit> getAllStorageUnits(){
        HashSet<StorageUnit> storageUnits = storageUnitDAO.getAllStorageUnits();
        return storageUnits;
    }

    @Override
    public StorageUnit getStorageUnitByISN(String isn){
        StorageUnit storageUnit = storageUnitDAO.getStorageUnitByISN(isn);
        return storageUnit;
    }

    @Override
    public void addStorageUnit(StorageUnit storageUnit){
        storageUnitDAO.addStorageUnit(storageUnit);
    }

    @Override
    public void delStorageUnitByISN(String isn){
        storageUnitDAO.delStorageUnitByISN(isn);
    }

    @Override
    public StorageUnit validateStorageUnit(String author, String title, String publishingHouse, String city, String year,
                                           String pagesCount, String isn, String text){

        StorageUnit storageUnit = new StorageUnit(author, title, publishingHouse, city, 0, 0, isn, text);

        Pattern p = Pattern.compile("^[a-zA-Zа-яА-ЯёЁ0-9-\\s.,_]{1,20}$+");
        Matcher m = p.matcher(author);
        if (!m.matches()){
            storageUnit.setAuthor("@Error1");
        }
        p = Pattern.compile("^[a-zA-Zа-яА-ЯёЁ.,0-9-\\s_]{1,50}$+");
        m = p.matcher(title);
        if (!m.matches()){
            storageUnit.setTitle("@Error1");
        }
        m = p.matcher(publishingHouse);
        if (!m.matches()){
            storageUnit.setPublishingHouse("@Error1");
        }
        m = p.matcher(city);
        if (!m.matches()){
            storageUnit.setCity("@Error1");
        }
        p = Pattern.compile("^[0-9]{1,4}$+");
        m = p.matcher(year);
        if (!m.matches()){
            storageUnit.setYear(-1);
        }
        else{
            storageUnit.setYear(Integer.parseInt(year));
        }
        m = p.matcher(pagesCount);
        if (!m.matches()){
            storageUnit.setPagesCount(-1);
        }
        else{
            storageUnit.setPagesCount(Integer.parseInt(pagesCount));
        }
        p = Pattern.compile("^[a-zA-Zа-яА-ЯёЁ0-9-]{1,50}$+");
        m = p.matcher(isn);
        if (!m.matches()){
            storageUnit.setTitle("@Error1");
        }
        if (text.replaceAll(" ","").equals("")){
            storageUnit.setText("@Error1");
        }

        return storageUnit;
    }
}
