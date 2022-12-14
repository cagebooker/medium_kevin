# README
仿 Medium 網站製作簡易版，跟龍哥的教學影片來製作此專案。

網站功能
1. 會員功能（登入登出）
2. 編寫文章
3. 文章上下架
4. 圖片上傳
5. 文章文字編輯器
6. 文章留言
7. 文章點讚（拍手）
8. 會員follow
9. 文章書籤
10. 收費會員制度

相關技術
* gem Devise 
  - 客製化 view
  - 客製化 controller。permit 新增的欄位
 
* model CRUD 
  -  認識流程

* 上傳圖片 active storage
  - 認識active storage
  - 新增欄位綁上指定model

* 留言功能
  - comment model 設計
  - 軟刪除 gem paranoid
  - stimulus.js 製作 ajax
  - API 設計

* 點讚
  - API 設計
  - stimulus.js 製作 ajax

* Follow功能
  - API 設計
  - stimulus.js 製作 ajax

* 書籤
  - API 設計
  - stimulus.js 製作 ajax

* 文字編輯器
  - Froala 外掛進表單中
  
* 收費功能
  - 刷卡機
