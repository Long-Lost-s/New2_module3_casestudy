package org.example.schoolmanagement.model;

import java.math.BigDecimal;

public class Score {
    private String subjectName;
    private BigDecimal theoryScore;
    private BigDecimal practiceScore;
    private BigDecimal averageScore;

    // Getters and Setters
    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public BigDecimal getTheoryScore() {
        return theoryScore;
    }

    public void setTheoryScore(BigDecimal theoryScore) {
        this.theoryScore = theoryScore;
    }

    public BigDecimal getPracticeScore() {
        return practiceScore;
    }

    public void setPracticeScore(BigDecimal practiceScore) {
        this.practiceScore = practiceScore;
    }

    public BigDecimal getAverageScore() {
        return averageScore;
    }

    public void setAverageScore(BigDecimal averageScore) {
        this.averageScore = averageScore;
    }
}