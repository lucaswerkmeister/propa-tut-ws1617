.PHONY: test clean

test: Main.class
	java -cp .. vacation.Main
EmployeeVacationRecord.class Main.class Month.class VacationReservationSystem.class VacationSystemException.class: EmployeeVacationRecord.java Main.java Month.java VacationReservationSystem.java VacationSystemException.java
	javac $^
clean:
	$(RM) EmployeeVacationRecord.class Main.class Month.class VacationReservationSystem.class VacationSystemException.class
