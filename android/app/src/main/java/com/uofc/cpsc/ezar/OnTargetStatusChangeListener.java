package com.uofc.cpsc.ezar;


import androidx.annotation.IntRange;
import androidx.annotation.Nullable;
import com.uofc.cpsc.ezar.data.Video;

public interface OnTargetStatusChangeListener {
    void onTargetStatusChange(
            @Nullable Video target,
            @IntRange(from = 0, to = 3) int mode,
            @IntRange(from = 0, to = 3) int status);
}
