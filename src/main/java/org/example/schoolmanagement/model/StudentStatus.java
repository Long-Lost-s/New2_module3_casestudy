package org.example.schoolmanagement.model;

public enum StudentStatus {
    DROPPED("Thôi học"),
    SUSPENDED("Đình chỉ"),
    TRANSFER("Chờ chuyển lớp"),
    STUDYING("Đang học");

    private final String name;

    StudentStatus(String string) {
        name = string;
    }

    public String toString() {
        return this.name;
    }

    public static StudentStatus fromString(String string) {
        switch (string) {
            case "Thôi học":
                return DROPPED;
            case "Đình chỉ":
                return SUSPENDED;
            case "Chờ chuyển lớp":
                return TRANSFER;
//            case "Đang học":
//                return STUDYING;
            default:
                return STUDYING;
        }
    }
}
