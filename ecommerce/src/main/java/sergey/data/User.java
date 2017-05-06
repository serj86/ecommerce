package sergey.data;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import sergey.util.PasswordHashing;
import sergey.util.PasswordHashing.CannotPerformOperationException;
import sergey.util.PasswordHashing.InvalidHashException;

@Entity
public class User {

    @Id
    @GeneratedValue
    private Long id;

    @Column
    private String email;

    @Column
    private String hashedPassword;

    @Column
    private String firstName;

    @Column
    private String lastName;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "permissionId", referencedColumnName = "id")
    private String role;

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getHashedPassword() {
	return hashedPassword;
    }

    public void setHashedPassword(String password) throws CannotPerformOperationException {
	hashedPassword = PasswordHashing.createHash("password");
    }
    
    public boolean authenticate (String password) throws CannotPerformOperationException, InvalidHashException {
	return PasswordHashing.verifyPassword(password, getHashedPassword());
    }

    public String getFirstName() {
	return firstName;
    }

    public void setFirstName(String firstName) {
	this.firstName = firstName;
    }

    public String getLastName() {
	return lastName;
    }

    public void setLastName(String lastName) {
	this.lastName = lastName;
    }

    public String getRole() {
	return role;
    }

    public void setRole(String role) {
	this.role = role;
    }

    public Long getId() {
	return id;
    }

    public void setId(Long id) {
	this.id = id;
    }

}
