package org.example.schoolmanagement.model;

public class Classes {
    private int classId;
    private String className;
<<<<<<< HEAD
    private int teacherId;

    public Classes(int classId, String className, int teacherId) {
        this.classId = classId;
        this.className = className;
        this.teacherId = teacherId;
    }

=======
    private int teacherID;

    // Getters and setters
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

<<<<<<< HEAD
    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }
}
=======
    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }
}
>>>>>>> 579e11e9e99cf35bd66e7da29a44e687175e2e83
