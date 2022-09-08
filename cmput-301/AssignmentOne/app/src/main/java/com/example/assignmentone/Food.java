package com.example.assignmentone;

import java.util.Date;

public class Food {

    public Date bestBeforeDate;
    public int count;
    public int unitCost;
    public String description;
    public String location;

    public Food(Date bestBeforeDate, int count, int unitCost, String description,
                String location) {
        this.bestBeforeDate = bestBeforeDate;
        this.count = count;
        this.unitCost = unitCost;
        this.description = description;
        this.location = location;
    }
}

