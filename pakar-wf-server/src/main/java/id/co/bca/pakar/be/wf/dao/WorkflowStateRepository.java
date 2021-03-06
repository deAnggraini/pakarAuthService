package id.co.bca.pakar.be.wf.dao;

import id.co.bca.pakar.be.wf.model.WorkflowStateModel;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkflowStateRepository extends CrudRepository<WorkflowStateModel, String> {
    @Query("SELECT m From WorkflowStateModel m " +
            "WHERE m.workflowStateTypeModel.id=1 " +
            "AND m.deleted IS FALSE")
    WorkflowStateModel findDefaultStartStateById();
    @Query("SELECT m From WorkflowStateModel m " +
            "WHERE m.workflowStateTypeModel.name='Start' " +
            "AND m.deleted IS FALSE")
    WorkflowStateModel findDefaultStartStateByName();
}
