package com.grailsAuthentication


class Task {

    Date date
    String title
    String task
    Boolean status
    User user


    static constraints = {
        date blank: false
        title blank: false
        task blank: false
        status blank: true, value: false
        user blank: false
    }


    @Override
    public String toString() {
        return "Task{" +
                "date=" + date +
                ", title='" + title + '\'' +
                ", task='" + task + '\'' +
                ", status=" + status +
                ", user=" + user +
                '}';
    }
}
