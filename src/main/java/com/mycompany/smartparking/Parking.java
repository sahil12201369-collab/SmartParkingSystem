package com.mycompany.smartparking;

public class Parking {

    private String vehicle;
    private String owner;
    private int slot;
    private boolean charging;   // NEW
    private String paymentStatus; // NEW

    public Parking(String vehicle, String owner, int slot, boolean charging, String paymentStatus) {
        this.vehicle = vehicle;
        this.owner = owner;
        this.slot = slot;
        this.charging = charging;
        this.paymentStatus = paymentStatus;
    }

    public String getVehicle() { return vehicle; }
    public String getOwner() { return owner; }
    public int getSlot() { return slot; }
    public boolean isCharging() { return charging; }
    public String getPaymentStatus() { return paymentStatus; }
}