package com.kuplay.kuplay.presenter;

import android.app.Activity;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import android.support.v7.app.AlertDialog;
import android.text.TextUtils;

import com.github.promeg.pinyinhelper.Pinyin;
import com.google.gson.Gson;
import com.kuplay.kuplay.app.MainActivity;
import com.kuplay.kuplay.base.BasePresenter;
import com.kuplay.kuplay.bean.ContactsInfo;
import com.kuplay.kuplay.iview.SelectContactsView;
import com.kuplay.kuplay.util.ContainerUtil;
import com.kuplay.kuplay.util.Logger;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by "iqos_jay@outlook.com" on 2018/8/27.
 */
public class SelectContactsPresenter extends BasePresenter<SelectContactsView> {
    public static final String SELECTED_CONTACTS = "selected_contacts";
    private List<ContactsInfo> mContactsInfoList = new LinkedList<>();

    /**
     * Constructor of BasePresenter.
     * All of the subs who extents this BasePresenter must implement this method.
     *
     * @param mActivity Activity,it is often used as context.
     */
    public SelectContactsPresenter(Activity mActivity) {
        super(mActivity);
    }

    /**
     * Initialize the view of App's callback.
     *
     * @param selectContactsView Generic parameter IV impl.
     */
    @Override
    public void initView(SelectContactsView selectContactsView) {
        super.iv = selectContactsView;
    }

    /**
     * 读取所有联系人
     */
    public void readAllContacts() {
        //联系人的Uri，也就是content://com.android.contacts/contacts
        Uri uri = ContactsContract.Contacts.CONTENT_URI;
        //指定获取_id和display_name两列数据，display_name即为姓名
        String[] projection = new String[]{
                ContactsContract.Contacts._ID,
                ContactsContract.Contacts.DISPLAY_NAME
        };
        String[] phoneProjection = new String[]{ContactsContract.CommonDataKinds.Phone.NUMBER};
        mContactsInfoList.clear();
        //根据Uri查询相应的ContentProvider，cursor为获取到的数据集
        Cursor cursor = ctx.getContentResolver().query(uri, projection, null, null, null);
        if (null == cursor) return;
        if (cursor.moveToFirst()) {
            do {
                ContactsInfo info = new ContactsInfo();
                Long id = cursor.getLong(0);
                String name = cursor.getString(1);
                info.setName(name);
                //根据联系人的ID获取此人的电话号码
                Cursor phonesCursor = ctx.getContentResolver().query(
                        ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
                        phoneProjection,
                        ContactsContract.CommonDataKinds.Phone.CONTACT_ID + "=" + id,
                        null,
                        null);
                //因为每个联系人可能有多个电话号码，所以需要遍历
                StringBuilder sb = new StringBuilder();
                if (phonesCursor != null && phonesCursor.moveToFirst()) {
                    do {
                        String num = phonesCursor.getString(0);
                        sb.append(num).append(",");
                    } while (phonesCursor.moveToNext());
                }
                if (sb.toString().endsWith(",")) {
                    sb.delete(sb.length() - 1, sb.length());
                }
                info.setPhoneNumber(sb.toString());
                if (TextUtils.isEmpty(info.getPhoneNumber())) continue;
                if (!TextUtils.isEmpty(info.getName())) {
                    info.setLetter(Pinyin.toPinyin(name.charAt(0)));
                }
                mContactsInfoList.add(info);
                if (null != phonesCursor) phonesCursor.close();
            } while (cursor.moveToNext());
        }
        cursor.close();
        Collections.sort(mContactsInfoList);
        iv.onShowAllContacts(mContactsInfoList);
    }

    /**
     * 遍历这个集合、找到所有被选择的联系人
     *
     * @return 被选中的联系人
     */
    private List<ContactsInfo> getSelectedContacts() {
        if (ContainerUtil.isNullOrEmpty(mContactsInfoList)) return null;
        List<ContactsInfo> result = new LinkedList<>();
        for (ContactsInfo info : mContactsInfoList) {
            if (info.isSelected())
                result.add(info);
        }
        return result;
    }

    /**
     * 点击了“联系人”添加
     */
    public void addContacts() {
        final Intent intent = new Intent();
        final List<ContactsInfo> selectedContacts = getSelectedContacts();
        if (ContainerUtil.isNullOrEmpty(selectedContacts)) {
            iv.onToast("您未选择任何联系人！");
        } else {
            AlertDialog alertDialog = new AlertDialog.Builder(ctx)
                    .setTitle("提示")
                    .setMessage("确定添加所选择的联系人？")
                    .setNegativeButton("取消", null)
                    .setPositiveButton("确定", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            Gson gson = new Gson();
                            String result = gson.toJson(selectedContacts);
                            intent.putExtra(SELECTED_CONTACTS, result);
                            ctx.setResult(MainActivity.APP_RESULT_CODE, intent);
                            ctx.finish();
                        }
                    })
                    .setCancelable(true)
                    .create();
            alertDialog.setCanceledOnTouchOutside(false);
            alertDialog.show();
        }
    }
}
