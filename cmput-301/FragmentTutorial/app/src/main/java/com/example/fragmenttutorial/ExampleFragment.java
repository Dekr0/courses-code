package com.example.fragmenttutorial;

import androidx.fragment.app.Fragment;

public class ExampleFragment extends Fragment {

    // Fragment library also provides more specialized fragment base classes:
    // DialogFragment - a floating dialog
    // PreferenceFragmentCompat - a hierarchy of Preference objects as a list

    // Fragment must be embedded within an AndroidX FragmentActivity (base class
    // for AppCompatActivity)

    // Add fragment to the activity's view hierarchy:
    //  1. defining fragment in your activity's layout file
    //  2. defining a fragment container in your activity's layout file and then
    // programmatically adding the fragment from within your activity

    // Require FragmentContainerView -> container for fragments

    public ExampleFragment() {

    }

}
