package id.co.bca.pakar.be.doc.dao;

import id.co.bca.pakar.be.doc.model.StructureIcons;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StructureIconRepository extends CrudRepository<StructureIcons, Long>{

}
