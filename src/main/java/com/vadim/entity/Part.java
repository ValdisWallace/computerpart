package com.vadim.entity;

import javax.persistence.*;

@Entity
@Table(name = "part")
public class Part {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "isneed")
    private boolean need;

    @Column(name = "count")
    private int count;

    public Part() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isNeed() {
        return need;
    }

    public void setNeed(boolean need) {
        this.need = need;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Part{" +
                ", count=" + count +
                "id=" + id +
                ", name='" + name + '\'' +
                ", need=" + need +
                '}';
    }
}
