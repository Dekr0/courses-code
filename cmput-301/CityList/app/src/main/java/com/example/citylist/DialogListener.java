package com.example.citylist;


/**
 * References:
 * https://developer.android.com/develop/ui/views/components/dialogs#PassingEvents
 */
public interface DialogListener {

    public void onDeleteDialogConfirmClick(int position);

    public void onAddCityDialogConfirmClick(String cityName, String province);

    public void onEditCityDialogConfirmClick(String oldCity, String newCity,
                                             String province);
}
