.class Lcom/android/server/UiModeManagerService;
.super Landroid/app/IUiModeManager$Stub;
.source "UiModeManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;
    }
.end annotation


# static fields
.field private static final ACTION_UPDATE_NIGHT_MODE:Ljava/lang/String; = "com.android.server.action.UPDATE_NIGHT_MODE"

.field private static final ENABLE_LAUNCH_CAR_DOCK_APP:Z = true

.field private static final ENABLE_LAUNCH_DESK_DOCK_APP:Z = true

.field private static final FACTOR_GMT_OFFSET_LONGITUDE:D = 0.004166666666666667

.field private static final KEY_LAST_UPDATE_INTERVAL:Ljava/lang/String; = "LAST_UPDATE_INTERVAL"

.field private static final LOCATION_UPDATE_DISTANCE_METER:F = 20000.0f

.field private static final LOCATION_UPDATE_ENABLE_INTERVAL_MAX:J = 0xdbba0L

.field private static final LOCATION_UPDATE_ENABLE_INTERVAL_MIN:J = 0x1388L

.field private static final LOCATION_UPDATE_MS:J = 0x5265c00L

.field private static final LOG:Z = false

.field private static final MIN_LOCATION_UPDATE_MS:J = 0x1b7740L

.field private static final MSG_ENABLE_LOCATION_UPDATES:I = 0x1

.field private static final MSG_GET_NEW_LOCATION_UPDATE:I = 0x2

.field private static final MSG_UPDATE_TWILIGHT:I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAlarmManager:Landroid/app/AlarmManager;

.field private final mBatteryReceiver:Landroid/content/BroadcastReceiver;

.field private mCarModeEnabled:Z

.field private final mCarModeKeepsScreenOn:Z

.field private mCharging:Z

.field private mComputedNightMode:Z

.field private mConfiguration:Landroid/content/res/Configuration;

.field final mContext:Landroid/content/Context;

.field private mCurUiMode:I

.field private final mDeskModeKeepsScreenOn:Z

.field private final mDockModeReceiver:Landroid/content/BroadcastReceiver;

.field private mDockState:I

.field private final mEmptyLocationListener:Landroid/location/LocationListener;

.field private final mHandler:Landroid/os/Handler;

.field private mHoldingConfiguration:Z

.field private mLastBroadcastState:I

.field private mLocation:Landroid/location/Location;

.field private final mLocationListener:Landroid/location/LocationListener;

.field private mLocationManager:Landroid/location/LocationManager;

.field final mLock:Ljava/lang/Object;

.field private mNightMode:I

.field private mNotificationManager:Landroid/app/NotificationManager;

.field private final mResultReceiver:Landroid/content/BroadcastReceiver;

.field private mSetUiMode:I

.field private mStatusBarManager:Landroid/app/StatusBarManager;

.field mSystemReady:Z

.field private final mTwilightUpdateReceiver:Landroid/content/BroadcastReceiver;

.field private final mUpdateLocationReceiver:Landroid/content/BroadcastReceiver;

.field private final mWakeLock:Landroid/os/PowerManager$WakeLock;

.field mNormalType:I

.field final mUIModeScaleChangedObserver:Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    const-class v0, Landroid/app/UiModeManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/server/UiModeManagerService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 8
    .parameter "context"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {p0}, Landroid/app/IUiModeManager$Stub;-><init>()V

    new-instance v2, Ljava/lang/Object;

    invoke-direct/range {v2 .. v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    iput v4, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    iput v4, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    iput v3, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    iput-boolean v4, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    iput-boolean v4, p0, Lcom/android/server/UiModeManagerService;->mCharging:Z

    iput v4, p0, Lcom/android/server/UiModeManagerService;->mCurUiMode:I

    iput v4, p0, Lcom/android/server/UiModeManagerService;->mSetUiMode:I

    iput-boolean v4, p0, Lcom/android/server/UiModeManagerService;->mHoldingConfiguration:Z

    new-instance v2, Landroid/content/res/Configuration;

    invoke-direct {v2}, Landroid/content/res/Configuration;-><init>()V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mConfiguration:Landroid/content/res/Configuration;

    new-instance v2, Lcom/android/server/UiModeManagerService$1;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$1;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mResultReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Lcom/android/server/UiModeManagerService$2;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$2;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mTwilightUpdateReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Lcom/android/server/UiModeManagerService$3;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$3;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mDockModeReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Lcom/android/server/UiModeManagerService$4;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$4;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mBatteryReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Lcom/android/server/UiModeManagerService$5;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$5;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mUpdateLocationReceiver:Landroid/content/BroadcastReceiver;

    iput v3, p0, Lcom/android/server/UiModeManagerService;->mNormalType:I

    new-instance v2, Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;

    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    invoke-direct {v2, p0, v5}, Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;-><init>(Lcom/android/server/UiModeManagerService;Landroid/os/Handler;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mUIModeScaleChangedObserver:Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;

    new-instance v2, Lcom/android/server/UiModeManagerService$6;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$6;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mEmptyLocationListener:Landroid/location/LocationListener;

    new-instance v2, Lcom/android/server/UiModeManagerService$7;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$7;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mLocationListener:Landroid/location/LocationListener;

    new-instance v2, Lcom/android/server/UiModeManagerService$8;

    invoke-direct {v2, p0}, Lcom/android/server/UiModeManagerService$8;-><init>(Lcom/android/server/UiModeManagerService;)V

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const-string v2, "uimode"

    invoke-static {v2, p0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const-string v5, "alarm"

    invoke-virtual {v2, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/AlarmManager;

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mAlarmManager:Landroid/app/AlarmManager;

    .line 334
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const-string v5, "location"

    invoke-virtual {v2, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/location/LocationManager;

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;

    .line 336
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/server/UiModeManagerService;->mTwilightUpdateReceiver:Landroid/content/BroadcastReceiver;

    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "com.android.server.action.UPDATE_NIGHT_MODE"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 338
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/server/UiModeManagerService;->mDockModeReceiver:Landroid/content/BroadcastReceiver;

    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.DOCK_EVENT"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 340
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/server/UiModeManagerService;->mBatteryReceiver:Landroid/content/BroadcastReceiver;

    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/server/UiModeManagerService;->mUpdateLocationReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v5, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    invoke-direct {p0}, Lcom/android/server/UiModeManagerService;->registerUIModeScaleChangedObserver()V

    const-string v2, "power"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 347
    .local v1, powerManager:Landroid/os/PowerManager;
    const/16 v2, 0x1a

    sget-object v5, Lcom/android/server/UiModeManagerService;->TAG:Ljava/lang/String;

    invoke-virtual {v1, v2, v5}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 349
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mConfiguration:Landroid/content/res/Configuration;

    invoke-virtual {v2}, Landroid/content/res/Configuration;->setToDefaults()V

    .line 351
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x10e000f

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    if-ne v2, v3, :cond_0

    move v2, v3

    :goto_0
    iput-boolean v2, p0, Lcom/android/server/UiModeManagerService;->mCarModeKeepsScreenOn:Z

    .line 353
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x10e000e

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    if-ne v2, v3, :cond_1

    :goto_1
    iput-boolean v3, p0, Lcom/android/server/UiModeManagerService;->mDeskModeKeepsScreenOn:Z

    .line 356
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "ui_night_mode"

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    .line 358
    return-void

    :cond_0
    move v2, v4

    .line 351
    goto :goto_0

    :cond_1
    move v3, v4

    .line 353
    goto :goto_1
.end method

.method static synthetic access$000(Lcom/android/server/UiModeManagerService;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/UiModeManagerService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mHoldingConfiguration:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/server/UiModeManagerService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/android/server/UiModeManagerService;->mHoldingConfiguration:Z

    return p1
.end method

.method static synthetic access$1100(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mLocationListener:Landroid/location/LocationListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/UiModeManagerService;)Landroid/content/res/Configuration;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mConfiguration:Landroid/content/res/Configuration;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/android/server/UiModeManagerService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/server/UiModeManagerService;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget v0, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    return v0
.end method

.method static synthetic access$500(Lcom/android/server/UiModeManagerService;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$602(Lcom/android/server/UiModeManagerService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    iput-boolean p1, p0, Lcom/android/server/UiModeManagerService;->mCharging:Z

    return p1
.end method

.method static synthetic access$700(Lcom/android/server/UiModeManagerService;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mSystemReady:Z

    return v0
.end method

.method static synthetic access$800(Lcom/android/server/UiModeManagerService;)Landroid/location/Location;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    return-object v0
.end method

.method static synthetic access$802(Lcom/android/server/UiModeManagerService;Landroid/location/Location;)Landroid/location/Location;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 60
    iput-object p1, p0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    return-object p1
.end method

.method static synthetic access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mEmptyLocationListener:Landroid/location/LocationListener;

    return-object v0
.end method

.method private adjustStatusBarCarModeLocked()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 608
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-nez v2, :cond_0

    .line 609
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const-string v4, "statusbar"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/StatusBarManager;

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 617
    :cond_0
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v2, :cond_1

    .line 618
    iget-object v4, p0, Lcom/android/server/UiModeManagerService;->mStatusBarManager:Landroid/app/StatusBarManager;

    iget-boolean v2, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eqz v2, :cond_4

    const/high16 v2, 0x8

    :goto_0
    invoke-virtual {v4, v2}, Landroid/app/StatusBarManager;->disable(I)V

    .line 623
    :cond_1
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mNotificationManager:Landroid/app/NotificationManager;

    if-nez v2, :cond_2

    .line 624
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const-string v4, "notification"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/NotificationManager;

    iput-object v2, p0, Lcom/android/server/UiModeManagerService;->mNotificationManager:Landroid/app/NotificationManager;

    .line 628
    :cond_2
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mNotificationManager:Landroid/app/NotificationManager;

    if-eqz v2, :cond_3

    .line 629
    iget-boolean v2, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eqz v2, :cond_5

    .line 630
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const-class v4, Lcom/android/internal/app/DisableCarModeActivity;

    invoke-direct {v0, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 632
    .local v0, carModeOffIntent:Landroid/content/Intent;
    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    .line 633
    .local v1, n:Landroid/app/Notification;
    const v2, 0x108063a

    iput v2, v1, Landroid/app/Notification;->icon:I

    .line 634
    const/4 v2, 0x4

    iput v2, v1, Landroid/app/Notification;->defaults:I

    .line 635
    const/4 v2, 0x2

    iput v2, v1, Landroid/app/Notification;->flags:I

    .line 636
    const-wide/16 v4, 0x0

    iput-wide v4, v1, Landroid/app/Notification;->when:J

    .line 637
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const v5, 0x1040548

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const v6, 0x1040549

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    invoke-static {v6, v3, v0, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    invoke-virtual {v1, v2, v4, v5, v6}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 642
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v2, v3, v1}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 647
    .end local v0           #carModeOffIntent:Landroid/content/Intent;
    .end local v1           #n:Landroid/app/Notification;
    :cond_3
    :goto_1
    return-void

    :cond_4
    move v2, v3

    .line 618
    goto :goto_0

    .line 644
    :cond_5
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mNotificationManager:Landroid/app/NotificationManager;

    invoke-virtual {v2, v3}, Landroid/app/NotificationManager;->cancel(I)V

    goto :goto_1
.end method

.method static buildHomeIntent(Ljava/lang/String;)Landroid/content/Intent;
    .locals 2
    .parameter "category"

    .prologue
    .line 115
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 116
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {v0, p0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 117
    const/high16 v1, 0x1020

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 119
    return-object v0
.end method

.method static final isDeskDockState(I)Z
    .locals 1
    .parameter "state"

    .prologue
    .line 445
    packed-switch p0, :pswitch_data_0

    .line 451
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 449
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 445
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public disableCarMode(I)V
    .locals 2
    .parameter "flags"

    .prologue
    .line 361
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 362
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/android/server/UiModeManagerService;->setCarModeLocked(Z)V

    .line 363
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mSystemReady:Z

    if-eqz v0, :cond_0

    .line 364
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    .line 366
    :cond_0
    monitor-exit v1

    .line 367
    return-void

    .line 366
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 2
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 836
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const-string v1, "android.permission.DUMP"

    invoke-virtual {v0, v1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 839
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Permission Denial: can\'t dump uimode service from from pid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 860
    :goto_0
    return-void

    .line 845
    :cond_0
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 846
    :try_start_0
    const-string v0, "Current UI Mode Service state:"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 847
    const-string v0, "  mDockState="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 848
    const-string v0, " mLastBroadcastState="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(I)V

    .line 849
    const-string v0, "  mNightMode="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 850
    const-string v0, " mCarModeEnabled="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 851
    const-string v0, " mComputedNightMode="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mComputedNightMode:Z

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 852
    const-string v0, "  mCurUiMode=0x"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/UiModeManagerService;->mCurUiMode:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 853
    const-string v0, " mSetUiMode=0x"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget v0, p0, Lcom/android/server/UiModeManagerService;->mSetUiMode:I

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 854
    const-string v0, "  mHoldingConfiguration="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mHoldingConfiguration:Z

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Z)V

    .line 855
    const-string v0, " mSystemReady="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mSystemReady:Z

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 856
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    if-eqz v0, :cond_1

    .line 857
    const-string v0, "  mLocation="

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 859
    :cond_1
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public enableCarMode(I)V
    .locals 2
    .parameter "flags"

    .prologue
    .line 370
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 371
    const/4 v0, 0x1

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/android/server/UiModeManagerService;->setCarModeLocked(Z)V

    .line 372
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mSystemReady:Z

    if-eqz v0, :cond_0

    .line 373
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    .line 375
    :cond_0
    monitor-exit v1

    .line 376
    return-void

    .line 375
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getCurrentModeType()I
    .locals 2

    .prologue
    .line 379
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 380
    :try_start_0
    iget v0, p0, Lcom/android/server/UiModeManagerService;->mCurUiMode:I

    and-int/lit8 v0, v0, 0xf

    monitor-exit v1

    return v0

    .line 381
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getNightMode()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 410
    iget v0, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    return v0
.end method

.method isDoingNightMode()Z
    .locals 1

    .prologue
    .line 423
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method setCarModeLocked(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 427
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eq v0, p1, :cond_0

    .line 428
    iput-boolean p1, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    .line 430
    :cond_0
    return-void
.end method

.method public setNightMode(I)V
    .locals 6
    .parameter "mode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 385
    iget-object v3, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 386
    packed-switch p1, :pswitch_data_0

    .line 392
    :try_start_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown mode: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 406
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 394
    :pswitch_0
    :try_start_1
    invoke-virtual {p0}, Lcom/android/server/UiModeManagerService;->isDoingNightMode()Z

    move-result v2

    if-nez v2, :cond_0

    .line 395
    monitor-exit v3

    .line 407
    :goto_0
    return-void

    .line 398
    :cond_0
    iget v2, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    if-eq v2, p1, :cond_1

    .line 399
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v0

    .line 400
    .local v0, ident:J
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v4, "ui_night_mode"

    invoke-static {v2, v4, p1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 402
    invoke-static {v0, v1}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 403
    iput p1, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    .line 404
    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    .line 406
    .end local v0           #ident:J
    :cond_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 386
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method systemReady()V
    .locals 5

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 414
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 415
    const/4 v3, 0x1

    :try_start_0
    iput-boolean v3, p0, Lcom/android/server/UiModeManagerService;->mSystemReady:Z

    .line 416
    iget v3, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    .line 417
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    .line 418
    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 419
    monitor-exit v2

    .line 420
    return-void

    :cond_0
    move v0, v1

    .line 416
    goto :goto_0

    .line 419
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method final updateConfigurationLocked(Z)V
    .locals 4
    .parameter "sendIt"

    .prologue
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mNormalType:I

    .local v1, uiMode:I
    iget-boolean v2, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eqz v2, :cond_2

    const/4 v1, 0x3

    :cond_0
    :goto_0
    iget-boolean v2, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eqz v2, :cond_5

    iget v2, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    if-nez v2, :cond_4

    invoke-virtual {p0}, Lcom/android/server/UiModeManagerService;->updateTwilightLocked()V

    iget-boolean v2, p0, Lcom/android/server/UiModeManagerService;->mComputedNightMode:Z

    if-eqz v2, :cond_3

    const/16 v2, 0x20

    :goto_1
    or-int/2addr v1, v2

    .line 483
    :goto_2
    iput v1, p0, Lcom/android/server/UiModeManagerService;->mCurUiMode:I

    .line 485
    iget-boolean v2, p0, Lcom/android/server/UiModeManagerService;->mHoldingConfiguration:Z

    if-nez v2, :cond_1

    iget v2, p0, Lcom/android/server/UiModeManagerService;->mSetUiMode:I

    if-eq v1, v2, :cond_1

    .line 486
    iput v1, p0, Lcom/android/server/UiModeManagerService;->mSetUiMode:I

    .line 487
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mConfiguration:Landroid/content/res/Configuration;

    iput v1, v2, Landroid/content/res/Configuration;->uiMode:I

    .line 489
    if-eqz p1, :cond_1

    .line 491
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v2

    iget-object v3, p0, Lcom/android/server/UiModeManagerService;->mConfiguration:Landroid/content/res/Configuration;

    invoke-interface {v2, v3}, Landroid/app/IActivityManager;->updateConfiguration(Landroid/content/res/Configuration;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 497
    :cond_1
    :goto_3
    return-void

    .line 459
    :cond_2
    iget v2, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    invoke-static {v2}, Lcom/android/server/UiModeManagerService;->isDeskDockState(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 460
    const/4 v1, 0x2

    goto :goto_0

    .line 465
    :cond_3
    const/16 v2, 0x10

    goto :goto_1

    .line 468
    :cond_4
    iget v2, p0, Lcom/android/server/UiModeManagerService;->mNightMode:I

    shl-int/lit8 v2, v2, 0x4

    or-int/2addr v1, v2

    goto :goto_2

    .line 472
    :cond_5
    and-int/lit8 v2, v1, -0x31

    or-int/lit8 v1, v2, 0x10

    goto :goto_2

    .line 492
    :catch_0
    move-exception v0

    .line 493
    .local v0, e:Landroid/os/RemoteException;
    sget-object v2, Lcom/android/server/UiModeManagerService;->TAG:Ljava/lang/String;

    const-string v3, "Failure communicating with activity manager"

    invoke-static {v2, v3, v0}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3
.end method

.method updateDockState(I)V
    .locals 5
    .parameter "newState"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 433
    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 434
    :try_start_0
    iget v3, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    if-eq p1, v3, :cond_0

    .line 435
    iput p1, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    .line 436
    iget v3, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/server/UiModeManagerService;->setCarModeLocked(Z)V

    .line 437
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService;->mSystemReady:Z

    if-eqz v0, :cond_0

    .line 438
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    .line 441
    :cond_0
    monitor-exit v2

    .line 442
    return-void

    :cond_1
    move v0, v1

    .line 436
    goto :goto_0

    .line 441
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method final updateLocked(II)V
    .locals 15
    .parameter "enableFlags"
    .parameter "disableFlags"

    .prologue
    .line 500
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    move-result-wide v11

    .line 503
    .local v11, ident:J
    const/4 v9, 0x0

    .line 504
    .local v9, action:Ljava/lang/String;
    const/4 v14, 0x0

    .line 505
    .local v14, oldAction:Ljava/lang/String;
    :try_start_0
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    const/4 v3, 0x2

    if-ne v1, v3, :cond_7

    .line 506
    invoke-direct {p0}, Lcom/android/server/UiModeManagerService;->adjustStatusBarCarModeLocked()V

    .line 507
    sget-object v14, Landroid/app/UiModeManager;->ACTION_EXIT_CAR_MODE:Ljava/lang/String;

    .line 512
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eqz v1, :cond_8

    .line 513
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_2

    .line 514
    invoke-direct {p0}, Lcom/android/server/UiModeManagerService;->adjustStatusBarCarModeLocked()V

    .line 516
    if-eqz v14, :cond_1

    .line 517
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 519
    :cond_1
    const/4 v1, 0x2

    iput v1, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    .line 520
    sget-object v9, Landroid/app/UiModeManager;->ACTION_ENTER_CAR_MODE:Ljava/lang/String;

    .line 535
    :cond_2
    :goto_1
    if-eqz v9, :cond_b

    .line 548
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 549
    .local v2, intent:Landroid/content/Intent;
    const-string v1, "enableFlags"

    move/from16 v0, p1

    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 550
    const-string v1, "disableFlags"

    move/from16 v0, p2

    invoke-virtual {v2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 551
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/server/UiModeManagerService;->mResultReceiver:Landroid/content/BroadcastReceiver;

    const/4 v5, 0x0

    const/4 v6, -0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;Landroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 556
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/server/UiModeManagerService;->mHoldingConfiguration:Z

    .line 589
    .end local v2           #intent:Landroid/content/Intent;
    :cond_3
    :goto_2
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/android/server/UiModeManagerService;->updateConfigurationLocked(Z)V

    .line 592
    iget-boolean v1, p0, Lcom/android/server/UiModeManagerService;->mCharging:Z

    if-eqz v1, :cond_f

    iget-boolean v1, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lcom/android/server/UiModeManagerService;->mCarModeKeepsScreenOn:Z

    if-nez v1, :cond_5

    :cond_4
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mCurUiMode:I

    const/4 v3, 0x2

    if-ne v1, v3, :cond_f

    iget-boolean v1, p0, Lcom/android/server/UiModeManagerService;->mDeskModeKeepsScreenOn:Z

    if-eqz v1, :cond_f

    :cond_5
    const/4 v13, 0x1

    .line 595
    .local v13, keepScreenOn:Z
    :goto_3
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eq v13, v1, :cond_6

    .line 596
    if-eqz v13, :cond_10

    .line 597
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 603
    :cond_6
    :goto_4
    invoke-static {v11, v12}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 605
    return-void

    .line 508
    .end local v13           #keepScreenOn:Z
    :cond_7
    :try_start_1
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->isDeskDockState(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 509
    sget-object v14, Landroid/app/UiModeManager;->ACTION_EXIT_DESK_MODE:Ljava/lang/String;

    goto :goto_0

    .line 522
    :cond_8
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->isDeskDockState(I)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 523
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->isDeskDockState(I)Z

    move-result v1

    if-nez v1, :cond_2

    .line 524
    if-eqz v14, :cond_9

    .line 525
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3, v14}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 527
    :cond_9
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    iput v1, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    .line 528
    sget-object v9, Landroid/app/UiModeManager;->ACTION_ENTER_DESK_MODE:Ljava/lang/String;

    goto :goto_1

    .line 531
    :cond_a
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/server/UiModeManagerService;->mLastBroadcastState:I

    .line 532
    move-object v9, v14

    goto/16 :goto_1

    .line 558
    :cond_b
    const/4 v10, 0x0

    .line 559
    .local v10, homeIntent:Landroid/content/Intent;
    iget-boolean v1, p0, Lcom/android/server/UiModeManagerService;->mCarModeEnabled:Z

    if-eqz v1, :cond_d

    .line 560
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_c

    .line 562
    const-string v1, "android.intent.category.CAR_DOCK"

    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->buildHomeIntent(Ljava/lang/String;)Landroid/content/Intent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v10

    .line 581
    :cond_c
    :goto_5
    if-eqz v10, :cond_3

    .line 583
    :try_start_2
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v10}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    .line 584
    :catch_0
    move-exception v1

    goto :goto_2

    .line 564
    :cond_d
    :try_start_3
    iget v1, p0, Lcom/android/server/UiModeManagerService;->mDockState:I

    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->isDeskDockState(I)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 565
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v3, "desk_home_screen_display"

    const/4 v4, 0x1

    invoke-static {v1, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_c

    .line 568
    const-string v1, "android.intent.category.DESK_DOCK"

    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->buildHomeIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v10

    goto :goto_5

    .line 571
    :cond_e
    and-int/lit8 v1, p2, 0x1

    if-eqz v1, :cond_c

    .line 572
    const-string v1, "android.intent.category.HOME"

    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->buildHomeIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v10

    goto :goto_5

    .line 592
    .end local v10           #homeIntent:Landroid/content/Intent;
    :cond_f
    const/4 v13, 0x0

    goto/16 :goto_3

    .line 599
    .restart local v13       #keepScreenOn:Z
    :cond_10
    iget-object v1, p0, Lcom/android/server/UiModeManagerService;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_4

    .line 603
    .end local v13           #keepScreenOn:Z
    :catchall_0
    move-exception v1

    invoke-static {v11, v12}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    throw v1
.end method

.method updateTwilightLocked()V
    .locals 17

    .prologue
    .line 787
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    if-nez v4, :cond_0

    .line 832
    :goto_0
    return-void

    .line 790
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 793
    .local v2, currentTime:J
    new-instance v1, Lcom/android/server/TwilightCalculator;

    invoke-direct {v1}, Lcom/android/server/TwilightCalculator;-><init>()V

    .line 794
    .local v1, tw:Lcom/android/server/TwilightCalculator;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    invoke-virtual {v4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    invoke-virtual {v6}, Landroid/location/Location;->getLongitude()D

    move-result-wide v6

    invoke-virtual/range {v1 .. v7}, Lcom/android/server/TwilightCalculator;->calculateTwilight(JDD)V

    .line 796
    iget v4, v1, Lcom/android/server/TwilightCalculator;->mState:I

    if-nez v4, :cond_2

    .line 797
    const/4 v14, 0x0

    .line 803
    .local v14, nightMode:Z
    :goto_1
    const-wide/16 v12, 0x0

    .line 804
    .local v12, nextUpdate:J
    iget-wide v4, v1, Lcom/android/server/TwilightCalculator;->mSunrise:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-eqz v4, :cond_1

    iget-wide v4, v1, Lcom/android/server/TwilightCalculator;->mSunset:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_3

    .line 806
    :cond_1
    const-wide/32 v4, 0x2932e00

    add-long v12, v2, v4

    .line 825
    :goto_2
    new-instance v16, Landroid/content/Intent;

    const-string v4, "com.android.server.action.UPDATE_NIGHT_MODE"

    move-object/from16 v0, v16

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 826
    .local v16, updateIntent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, v16

    invoke-static {v4, v5, v0, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v15

    .line 828
    .local v15, pendingIntent:Landroid/app/PendingIntent;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/UiModeManagerService;->mAlarmManager:Landroid/app/AlarmManager;

    invoke-virtual {v4, v15}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 829
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/UiModeManagerService;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v12, v13, v15}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 831
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/android/server/UiModeManagerService;->mComputedNightMode:Z

    goto :goto_0

    .line 799
    .end local v12           #nextUpdate:J
    .end local v14           #nightMode:Z
    .end local v15           #pendingIntent:Landroid/app/PendingIntent;
    .end local v16           #updateIntent:Landroid/content/Intent;
    :cond_2
    const/4 v14, 0x1

    .restart local v14       #nightMode:Z
    goto :goto_1

    .line 808
    .restart local v12       #nextUpdate:J
    :cond_3
    iget v11, v1, Lcom/android/server/TwilightCalculator;->mState:I

    .line 810
    .local v11, mLastTwilightState:I
    const-wide/32 v4, 0xea60

    add-long/2addr v12, v4

    .line 811
    iget-wide v4, v1, Lcom/android/server/TwilightCalculator;->mSunset:J

    cmp-long v4, v2, v4

    if-lez v4, :cond_4

    .line 813
    const-wide/32 v4, 0x5265c00

    add-long v5, v2, v4

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    invoke-virtual {v4}, Landroid/location/Location;->getLatitude()D

    move-result-wide v7

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;

    invoke-virtual {v4}, Landroid/location/Location;->getLongitude()D

    move-result-wide v9

    move-object v4, v1

    invoke-virtual/range {v4 .. v10}, Lcom/android/server/TwilightCalculator;->calculateTwilight(JDD)V

    .line 818
    :cond_4
    const/4 v4, 0x1

    if-ne v11, v4, :cond_5

    .line 819
    iget-wide v4, v1, Lcom/android/server/TwilightCalculator;->mSunrise:J

    add-long/2addr v12, v4

    goto :goto_2

    .line 821
    :cond_5
    iget-wide v4, v1, Lcom/android/server/TwilightCalculator;->mSunset:J

    add-long/2addr v12, v4

    goto :goto_2
.end method

.method private registerUIModeScaleChangedObserver()V
    .locals 4
    .annotation build Landroid/annotation/MiuiHook;
        value = .enum Landroid/annotation/MiuiHook$MiuiHookType;->NEW_METHOD:Landroid/annotation/MiuiHook$MiuiHookType;
    .end annotation

    .prologue
    const/4 v3, 0x0

    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "ui_mode_scale"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/UiModeManagerService;->mUIModeScaleChangedObserver:Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    iget-object v0, p0, Lcom/android/server/UiModeManagerService;->mUIModeScaleChangedObserver:Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;

    invoke-virtual {v0, v3}, Lcom/android/server/UiModeManagerService$UIModeScaleChangedObserver;->onChange(Z)V

    return-void
.end method
