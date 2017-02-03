import java.util.List;

public interface Company {
    public List<Employee> getEmployees();
    public void hire(Employee employee);
    public void fire(Employee employee);
}
