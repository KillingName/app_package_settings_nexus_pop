.class public Lcom/android/settings/RingerVolumePreference;
.super Landroid/preference/VolumePreference;
.source "RingerVolumePreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/settings/RingerVolumePreference$SavedState;
    }
.end annotation


# static fields
.field private static final SEEKBAR_ID:[I = null

.field private static final SEEKBAR_TYPE:[I = null

.field private static final TAG:Ljava/lang/String; = "RingerVolumePreference"


# instance fields
.field private mNotificationVolumeTitle:Landroid/widget/TextView;

.field private mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

.field private mOrigNotificationsUseRingVolume:Z

.field private mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 45
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    .line 50
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    return-void

    .line 45
    :array_0
    .array-data 0x4
        0x92t 0x0t 0xbt 0x7ft
        0x8et 0x0t 0xbt 0x7ft
        0x8ft 0x0t 0xbt 0x7ft
    .end array-data

    .line 50
    :array_1
    .array-data 0x4
        0x5t 0x0t 0x0t 0x0t
        0x3t 0x0t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Landroid/preference/VolumePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/android/settings/RingerVolumePreference;->setStreamType(I)V

    .line 64
    const v0, 0x7f03002f

    invoke-virtual {p0, v0}, Lcom/android/settings/RingerVolumePreference;->setDialogLayoutResource(I)V

    .line 65
    const v0, 0x7f020074

    invoke-virtual {p0, v0}, Lcom/android/settings/RingerVolumePreference;->setDialogIcon(I)V

    .line 67
    sget-object v0, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v0, v0

    new-array v0, v0, [Landroid/preference/VolumePreference$SeekBarVolumizer;

    iput-object v0, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    .line 68
    return-void
.end method

.method static synthetic access$000()[I
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    return-object v0
.end method

.method private cleanup()V
    .locals 4

    .prologue
    .line 149
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget-object v2, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 150
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v2, v2, v1

    if-eqz v2, :cond_1

    .line 151
    invoke-virtual {p0}, Lcom/android/settings/RingerVolumePreference;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    .line 152
    .local v0, dialog:Landroid/app/Dialog;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 154
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/preference/VolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 156
    :cond_0
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/preference/VolumePreference$SeekBarVolumizer;->stop()V

    .line 157
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    const/4 v3, 0x0

    aput-object v3, v2, v1

    .line 149
    .end local v0           #dialog:Landroid/app/Dialog;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 160
    :cond_2
    return-void
.end method

.method private setNotificationVolumeVisibility(Z)V
    .locals 4
    .parameter "visible"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 141
    iget-object v0, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v0, v0, v2

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v0, v0, v2

    invoke-virtual {v0}, Landroid/preference/VolumePreference$SeekBarVolumizer;->getSeekBar()Landroid/widget/SeekBar;

    move-result-object v0

    if-eqz p1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 145
    :cond_0
    iget-object v0, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationVolumeTitle:Landroid/widget/TextView;

    if-eqz p1, :cond_2

    move v1, v2

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 146
    return-void

    :cond_1
    move v1, v3

    .line 142
    goto :goto_0

    :cond_2
    move v1, v3

    .line 145
    goto :goto_1
.end method

.method private updateNotificationsUseRingVolumeSetting(Z)V
    .locals 5
    .parameter "active"

    .prologue
    const/4 v4, 0x0

    .line 128
    invoke-virtual {p0}, Lcom/android/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "notifications_use_ring_volume"

    if-eqz p1, :cond_1

    const/4 v3, 0x1

    :goto_0
    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 130
    if-eqz p1, :cond_0

    .line 133
    invoke-virtual {p0}, Lcom/android/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 135
    .local v0, audioManager:Landroid/media/AudioManager;
    const/4 v1, 0x5

    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    invoke-virtual {v0, v1, v2, v4}, Landroid/media/AudioManager;->setStreamVolume(III)V

    .line 138
    .end local v0           #audioManager:Landroid/media/AudioManager;
    :cond_0
    return-void

    :cond_1
    move v3, v4

    .line 128
    goto :goto_0
.end method


# virtual methods
.method public onActivityStop()V
    .locals 0

    .prologue
    .line 110
    invoke-super {p0}, Landroid/preference/VolumePreference;->onActivityStop()V

    .line 111
    invoke-direct {p0}, Lcom/android/settings/RingerVolumePreference;->cleanup()V

    .line 112
    return-void
.end method

.method protected onBindDialogView(Landroid/view/View;)V
    .locals 8
    .parameter "view"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 72
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onBindDialogView(Landroid/view/View;)V

    .line 74
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget-object v2, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 75
    sget-object v2, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    aget v2, v2, v0

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/SeekBar;

    .line 76
    .local v1, seekBar:Landroid/widget/SeekBar;
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    new-instance v3, Landroid/preference/VolumePreference$SeekBarVolumizer;

    invoke-virtual {p0}, Lcom/android/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_TYPE:[I

    aget v5, v5, v0

    invoke-direct {v3, p0, v4, v1, v5}, Landroid/preference/VolumePreference$SeekBarVolumizer;-><init>(Landroid/preference/VolumePreference;Landroid/content/Context;Landroid/widget/SeekBar;I)V

    aput-object v3, v2, v0

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 80
    .end local v1           #seekBar:Landroid/widget/SeekBar;
    :cond_0
    const v2, 0x7f0b0091

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationVolumeTitle:Landroid/widget/TextView;

    .line 81
    const v2, 0x7f0b0090

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/CheckBox;

    iput-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    .line 83
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v2, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 84
    invoke-virtual {p0}, Lcom/android/settings/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "notifications_use_ring_volume"

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v6, :cond_1

    move v2, v6

    :goto_1
    iput-boolean v2, p0, Lcom/android/settings/RingerVolumePreference;->mOrigNotificationsUseRingVolume:Z

    .line 87
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    iget-boolean v3, p0, Lcom/android/settings/RingerVolumePreference;->mOrigNotificationsUseRingVolume:Z

    invoke-virtual {v2, v3}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 88
    iget-object v2, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v2}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v2

    if-nez v2, :cond_2

    move v2, v6

    :goto_2
    invoke-direct {p0, v2}, Lcom/android/settings/RingerVolumePreference;->setNotificationVolumeVisibility(Z)V

    .line 89
    return-void

    :cond_1
    move v2, v7

    .line 84
    goto :goto_1

    :cond_2
    move v2, v7

    .line 88
    goto :goto_2
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 115
    if-nez p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-direct {p0, v0}, Lcom/android/settings/RingerVolumePreference;->setNotificationVolumeVisibility(Z)V

    .line 116
    invoke-direct {p0, p2}, Lcom/android/settings/RingerVolumePreference;->updateNotificationsUseRingVolumeSetting(Z)V

    .line 117
    return-void

    .line 115
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onDialogClosed(Z)V
    .locals 6
    .parameter "positiveResult"

    .prologue
    .line 93
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onDialogClosed(Z)V

    .line 95
    if-nez p1, :cond_2

    .line 96
    iget-object v0, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    .local v0, arr$:[Landroid/preference/VolumePreference$SeekBarVolumizer;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 97
    .local v4, vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/preference/VolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 96
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 100
    .end local v4           #vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_1
    iget-object v5, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    .line 101
    .local v1, checked:Z
    iget-boolean v5, p0, Lcom/android/settings/RingerVolumePreference;->mOrigNotificationsUseRingVolume:Z

    if-eq v5, v1, :cond_2

    .line 102
    iget-boolean v5, p0, Lcom/android/settings/RingerVolumePreference;->mOrigNotificationsUseRingVolume:Z

    invoke-direct {p0, v5}, Lcom/android/settings/RingerVolumePreference;->updateNotificationsUseRingVolumeSetting(Z)V

    .line 105
    .end local v0           #arr$:[Landroid/preference/VolumePreference$SeekBarVolumizer;
    .end local v1           #checked:Z
    .end local v2           #i$:I
    .end local v3           #len$:I
    :cond_2
    invoke-direct {p0}, Lcom/android/settings/RingerVolumePreference;->cleanup()V

    .line 106
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 7
    .parameter "state"

    .prologue
    .line 191
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lcom/android/settings/RingerVolumePreference$SavedState;

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 193
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 211
    :cond_1
    :goto_0
    return-void

    .line 197
    :cond_2
    move-object v0, p1

    check-cast v0, Lcom/android/settings/RingerVolumePreference$SavedState;

    move-object v2, v0

    .line 198
    .local v2, myState:Lcom/android/settings/RingerVolumePreference$SavedState;
    invoke-virtual {v2}, Lcom/android/settings/RingerVolumePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v5

    invoke-super {p0, v5}, Landroid/preference/VolumePreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 199
    sget-object v5, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    invoke-virtual {v2, v5}, Lcom/android/settings/RingerVolumePreference$SavedState;->getVolumeStore(I)[Landroid/preference/VolumePreference$VolumeStore;

    move-result-object v4

    .line 200
    .local v4, volumeStore:[Landroid/preference/VolumePreference$VolumeStore;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    sget-object v5, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    if-ge v1, v5, :cond_4

    .line 201
    iget-object v5, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v3, v5, v1

    .line 202
    .local v3, vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_3

    .line 203
    aget-object v5, v4, v1

    invoke-virtual {v3, v5}, Landroid/preference/VolumePreference$SeekBarVolumizer;->onRestoreInstanceState(Landroid/preference/VolumePreference$VolumeStore;)V

    .line 200
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 207
    .end local v3           #vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_4
    iget-object v5, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    if-eqz v5, :cond_1

    .line 208
    iget-object v5, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    iget-boolean v6, v2, Lcom/android/settings/RingerVolumePreference$SavedState;->mUseRingVolumeForNotifications:Z

    invoke-virtual {v5, v6}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 209
    iget-boolean v5, v2, Lcom/android/settings/RingerVolumePreference$SavedState;->mOrigUseRingVolumeForNotifications:Z

    iput-boolean v5, p0, Lcom/android/settings/RingerVolumePreference;->mOrigNotificationsUseRingVolume:Z

    goto :goto_0
.end method

.method protected onSampleStarting(Landroid/preference/VolumePreference$SeekBarVolumizer;)V
    .locals 4
    .parameter "volumizer"

    .prologue
    .line 121
    invoke-super {p0, p1}, Landroid/preference/VolumePreference;->onSampleStarting(Landroid/preference/VolumePreference$SeekBarVolumizer;)V

    .line 122
    iget-object v0, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    .local v0, arr$:[Landroid/preference/VolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 123
    .local v3, vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_0

    if-eq v3, p1, :cond_0

    invoke-virtual {v3}, Landroid/preference/VolumePreference$SeekBarVolumizer;->stopSample()V

    .line 122
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 125
    .end local v3           #vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_1
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 6

    .prologue
    .line 164
    invoke-super {p0}, Landroid/preference/VolumePreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 165
    .local v2, superState:Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/android/settings/RingerVolumePreference;->isPersistent()Z

    move-result v5

    if-eqz v5, :cond_0

    move-object v5, v2

    .line 186
    :goto_0
    return-object v5

    .line 170
    :cond_0
    new-instance v1, Lcom/android/settings/RingerVolumePreference$SavedState;

    invoke-direct {v1, v2}, Lcom/android/settings/RingerVolumePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 171
    .local v1, myState:Lcom/android/settings/RingerVolumePreference$SavedState;
    sget-object v5, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    invoke-virtual {v1, v5}, Lcom/android/settings/RingerVolumePreference$SavedState;->getVolumeStore(I)[Landroid/preference/VolumePreference$VolumeStore;

    move-result-object v4

    .line 172
    .local v4, volumeStore:[Landroid/preference/VolumePreference$VolumeStore;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    sget-object v5, Lcom/android/settings/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    if-ge v0, v5, :cond_2

    .line 173
    iget-object v5, p0, Lcom/android/settings/RingerVolumePreference;->mSeekBarVolumizer:[Landroid/preference/VolumePreference$SeekBarVolumizer;

    aget-object v3, v5, v0

    .line 174
    .local v3, vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_1

    .line 175
    aget-object v5, v4, v0

    invoke-virtual {v3, v5}, Landroid/preference/VolumePreference$SeekBarVolumizer;->onSaveInstanceState(Landroid/preference/VolumePreference$VolumeStore;)V

    .line 172
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 179
    .end local v3           #vol:Landroid/preference/VolumePreference$SeekBarVolumizer;
    :cond_2
    iget-object v5, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    if-eqz v5, :cond_3

    .line 180
    iget-object v5, p0, Lcom/android/settings/RingerVolumePreference;->mNotificationsUseRingVolumeCheckbox:Landroid/widget/CheckBox;

    invoke-virtual {v5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v5

    iput-boolean v5, v1, Lcom/android/settings/RingerVolumePreference$SavedState;->mUseRingVolumeForNotifications:Z

    .line 182
    iget-boolean v5, p0, Lcom/android/settings/RingerVolumePreference;->mOrigNotificationsUseRingVolume:Z

    iput-boolean v5, v1, Lcom/android/settings/RingerVolumePreference$SavedState;->mOrigUseRingVolumeForNotifications:Z

    :cond_3
    move-object v5, v1

    .line 186
    goto :goto_0
.end method
