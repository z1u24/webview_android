package com.kuplay.kuplay.module;

import android.Manifest;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.text.TextUtils;

import com.github.dfqin.grantor.PermissionListener;
import com.github.dfqin.grantor.PermissionsUtil;
import com.kuplay.kuplay.R;
import com.kuplay.kuplay.app.MainActivity;
import com.kuplay.kuplay.app.SelectContactsActivity;
import com.kuplay.kuplay.base.BaseJSModule;
import com.kuplay.kuplay.common.js.JSCallback;
import com.kuplay.kuplay.presenter.SelectContactsPresenter;

/**
 * Created by "iqos_jay@outlook.com" on 2018/8/27.
 */
public class ContactsReader extends BaseJSModule {

    public void readInfo(int callbackId) {
        this.callbackId = callbackId;
        PermissionsUtil.requestPermission(ctx, new PermissionListener() {
            @Override
            public void permissionGranted(@NonNull String[] permission) {
                Intent intent = new Intent(ctx, SelectContactsActivity.class);
                ctx.startActivityForResult(intent, MainActivity.APP_RESULT_CODE);
            }

            @Override
            public void permissionDenied(@NonNull String[] permission) {

            }
        }, Manifest.permission.READ_CONTACTS);
    }

    /**
     * 拨打电话或者是发送短信
     *
     * @param callbackId  回调TS的id
     * @param phoneNumber 对方的电话号码
     * @param type        1、打电话 2、发短信
     */
    public void giveCallOrSMS(int callbackId, String phoneNumber, int type) {
        if (1 == type) {
            Intent intent = new Intent(Intent.ACTION_DIAL, Uri.parse(String.format("tel:%s", phoneNumber)));
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(intent);
        } else {
            Uri smsToUri = Uri.parse(String.format("smsto:%s", phoneNumber));
            Intent intent = new Intent(Intent.ACTION_SENDTO, smsToUri);
            intent.putExtra("sms_body", "");
            ctx.startActivity(intent);
        }
    }


    /**
     * What would you like to prompt user "You Missed Permission".
     *
     * @return the message content you want to prompt user.
     */
    @Override
    protected String getTipContentWithoutPermission() {
        return ctx.getResources().getString(R.string.tip_please_allow_app_read_contacts);
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
            case MainActivity.APP_RESULT_CODE:
                if (null == data) {
                    JSCallback.callJS(getActivity(), callbackId, JSCallback.FAIL, "");
                    break;
                }
                String result = data.getStringExtra(SelectContactsPresenter.SELECTED_CONTACTS);
                if (TextUtils.isEmpty(result)) {
                    JSCallback.callJS(getActivity(), callbackId, JSCallback.FAIL, "");
                } else {
                    JSCallback.callJS(getActivity(), callbackId, JSCallback.SUCCESS, result);
                }
                break;
        }
    }
}
