package com.saransh.utils;



public enum SortUtils {
    SortByName(0), SortById(1), SortByDiff(2);
    private final int value;

    SortUtils(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
