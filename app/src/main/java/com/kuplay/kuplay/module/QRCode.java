package com.kuplay.kuplay.module;

import android.Manifest;
import android.content.Intent;
import android.os.Build;
import android.support.annotation.NonNull;
import android.text.TextUtils;

import com.github.dfqin.grantor.PermissionListener;
import com.github.dfqin.grantor.PermissionsUtil;
import com.iqos.qrscanner.app.QRScannerActivity;
import com.kuplay.kuplay.R;
import com.kuplay.kuplay.base.BaseJSModule;
import com.kuplay.kuplay.common.js.JSCallback;

/**
 * Created by "iqos_jay@outlook.com" on 2018/6/27.
 * QRCode would be called by javaScript instead of java code.
 */
public class QRCode extends BaseJSModule {

    public void scan(int callbackId) {
        this.callbackId = callbackId;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            PermissionsUtil.requestPermission(ctx, new PermissionListener() {
                @Override
                public void permissionGranted(@NonNull String[] permission) {
                    jumpToScanQRCode();
                }

                @Override
                public void permissionDenied(@NonNull String[] permission) {

                }
            }, Manifest.permission.CAMERA);
        } else {
            jumpToScanQRCode();
        }
    }

    /**
     * 跳转到扫码
     */
    private void jumpToScanQRCode() {
        Intent intent = new Intent(ctx, QRScannerActivity.class);
        ctx.startActivityForResult(intent, QRScannerActivity.SCAN_RESULT_CODE);
    }

    /**
     * What would you like to prompt user "You Missed Permission".
     *
     * @return the message content you want to prompt user.
     */
    @Override
    protected String getTipContentWithoutPermission() {
        return ctx.getResources().getString(R.string.tip_please_allow_app_scan_qr_code);
    }

    /**
     * Dispatch incoming result to the correct fragment.
     *
     * @param requestCode request code
     * @param resultCode  the code of result,this mark is set by user,this will be used as mark.
     * @param data        Callback data from last Activity.
     */
    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        switch (resultCode) {
            case QRScannerActivity.SCAN_RESULT_CODE:
                if (null == data) {
                    JSCallback.callJS(null, null, callbackId, JSCallback.FAIL, "空");
                    break;
                }
                String result = data.getStringExtra(QRScannerActivity.SCAN_RESULT);
                if (TextUtils.isEmpty(result)) {
                    JSCallback.callJS(null, null, callbackId, JSCallback.FAIL, "空");
                } else {
                    JSCallback.callJS(null, null, callbackId, JSCallback.SUCCESS, result);
                }
                break;
        }
    }
}
