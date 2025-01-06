package org.example.schoolmanagement.model;

import java.time.LocalDate;
<<<<<<< HEAD
=======
import java.util.ArrayList;
import java.util.List;
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83

public class Student {
    private int studentId;
    private String fullName;
    private String email;
    private String phoneNumber;
    private StudentStatus status;
    private LocalDate dateOfBirth;
    private String address;
    private int classId;
<<<<<<< HEAD

    public Student(int studentId, String fullName,
                   String email, String phoneNumber,
                   StudentStatus status, LocalDate dateOfBirth,
                   String address, int classId) {
=======
    private List<Score> scores;

    public Student() {
        scores = new ArrayList<>();
    }

    public Student(int studentId, String fullName, String email, String phoneNumber, StudentStatus status, LocalDate dateOfBirth, String address, int classId) {
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
        this.studentId = studentId;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.status = status;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.classId = classId;
<<<<<<< HEAD
=======
        this.scores = new ArrayList<>();
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public StudentStatus getStatus() {
        return status;
    }

    public void setStatus(StudentStatus status) {
        this.status = status;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

<<<<<<< HEAD
=======
    public List<Score> getScores() {
        return scores;
    }

    public void addScore(Score score) {
        scores.add(score);
    }

>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
    @Override
    public String toString() {
        return "Student{" +
                "studentId=" + studentId +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", status=" + status +
                ", dateOfBirth=" + dateOfBirth +
                ", address='" + address + '\'' +
                ", classId=" + classId +
<<<<<<< HEAD
                '}';
    }
}
=======
                ", scores=" + scores +
                '}';
    }
}
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
