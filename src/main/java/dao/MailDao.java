package dao;

import java.util.Date;
import java.util.List;

import entity.Email;
import entity.Lianxi;
import entity.User;

public interface MailDao {
	abstract List<Email> findAll(String reciever);
	abstract List<Email> findAllSen(String sender);
	abstract List<Email> findDraftAll(String sender/*,int startRecord,int colNum*/);
	abstract List<Lianxi> findAllLian(String zhuren);
	abstract Email find(Integer id);
	abstract boolean send(Email email);
	abstract boolean sendR(Email email);
	abstract boolean save(Email email);
	abstract boolean insertLian(Lianxi lianxi);
	abstract boolean deleteAll(String sender);
	abstract boolean deleteAllLian(String zhuren);
	abstract boolean deleteLian(Integer id);
	abstract boolean deleteDraftAll(String sender);
	abstract boolean deleteSen(Integer id);
	abstract boolean delete(Integer id);
	abstract boolean deleteDraft(Integer id);
	abstract Integer findMaxId();
	abstract Integer findDraftMaxId();
	abstract Integer findLianMaxId();
	/*abstract Integer findCount(String sender);*/
}
