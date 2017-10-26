package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Converters.DateParser;
import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;
import com.codingschool.repairWeb.Repository.RepairRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class RepairServiceImpl implements RepairService{

    @Autowired
    private RepairRepository repairRepository;

    @Override
    public void save(Repair rep) {
        repairRepository.save(rep);
    }

    @Override
    public void delete(Long id) {
        repairRepository.deleteById(id);
    }

    @Override
    public List<Repair> findAdminRepairs() {
        LocalDateTime localDateTime = LocalDateTime.now();
        return repairRepository.findTop10ByDateTimeAfterOrderByDateTimeAsc(localDateTime);
    }

    @Override
    public List<Repair> find50Repairs() {
        LocalDateTime localDateTime = LocalDateTime.now();
        return repairRepository.findTop50ByDateTimeAfterOrderByDateTimeAsc(localDateTime);
    }
    @Override
    public List<Repair> find10RepairsAfter(LocalDateTime localDateTime) {

        return repairRepository.findTop10ByDateTimeAfterOrderByDateTimeAsc(localDateTime);
    }

    @Override
    public List<Repair> searchRepairsDates(String dateStart, String dateEnd) throws NoResultsFoundException {
        List<Repair> result;
        result = repairRepository.findByDateTimeAfterAndDateTimeBefore(DateParser.dateFromPicker(dateStart), DateParser.dateFromPicker(dateEnd));
        if(result.isEmpty()) throw new NoResultsFoundException("No repairs have found in this period");
        return result;
    }

    @Override
    public Repair findById(Long id) {
            return repairRepository.findById(id);
        }

    @Override
    public List<Repair> findVehiclesRepairs(Long id) throws NoResultsFoundException {
        List<Repair> res = repairRepository.findByVehicleId(id);
        if(res.isEmpty()) throw new NoResultsFoundException("This Vehicle has no repairs");
        else return res;
    }

}
