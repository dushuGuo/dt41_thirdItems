package cn.bdqn.datacockpit.entity;

import java.util.Date;

public class Info {
    private Integer id;

    private String title;
    private Date publishDate;
    private String date;

    private String details;

    private String publisher;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    @Override
    public String toString() {
        return "Info [id=" + id + ", title=" + title + ", publishdate=" + publishDate + ", details=" + details
                + ", publisher=" + publisher + "]";
    }

}
